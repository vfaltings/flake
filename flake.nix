{
  description = "Victor's NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
    extra-substituters = [
      # nix community's cache server
      "https://nix-community.cachix.org"

      # hyprland cache
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      # nix community's cache server
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

      # hyprland cache
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # Official NixOS package source, unstable branch used by default
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Official NixOS package source, stable branch for potential backups
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # NUR
    nur.url = github:nix-community/NUR;

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # hardware conf
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-stable, 
    nur,
    home-manager, 
    nixvim,
    hyprland,
    nixos-hardware,
  ... }@inputs: 
  let
    nixvimModule = nixvim.homeManagerModules.nixvim;
  in {
    nixosConfigurations = {
      # By default, NixOS will try to refer the nixosConfiguration with its hostname.
      # However, the configuration name can also be specified using `sudo nixos-rebuild switch --flake /path/to/flakes/directory#<name>`.
      # The `nixpkgs.lib.nixosSystem` function is used to build this configuration, the following attribute set is its parameter.
      # Run `sudo nixos-rebuild switch --flake .#nixos-test` in the flake's directory to deploy this configuration on any NixOS system
      "nixos" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        # A Nix Module can be an attribute set, or a function that returns an attribute set.
        # If a Module is a function, this function can only have the following parameters:
        #
        #  lib:     the nixpkgs function library, which provides many useful functions for operating Nix expressions
        #            https://nixos.org/manual/nixpkgs/stable/#id-1.4
        #  config:  all config options of the current flake
        #  options: all options defined in all NixOS Modules in the current flake
        #  pkgs:   a collection of all packages defined in nixpkgs.
        #           you can assume its default value is `nixpkgs.legacyPackages."${system}"` for now.
        #           can be customed by `nixpkgs.pkgs` option
        #  modulesPath: the default path of nixpkgs's builtin modules folder,
        #               used to import some extra modules from nixpkgs.
        #               this parameter is rarely used, you can ignore it for now.
        #
        # Only these parameters can be passed by default.

        specialArgs = { # pass custom arguments into sub module.
          pkgs-stable = import nixpkgs-stable {
            system = system;
            config.allowUnfree = true;
          };

	  nixvim = nixvim;
        };

        modules = [
          # NUR
          nur.nixosModules.nur

          # NixOS system configuration
          ./configuration.nix

          # Hardware conf
          nixos-hardware.nixosModules.lenovo-thinkpad-t480

          # Hyprland
          hyprland.nixosModules.default { programs.hyprland.enable = true; }

          # Home-manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.victor = {
              imports = [ 
                # NUR
                nur.nixosModules.nur

                ./home.nix 
                nixvimModule ];
            };
          }
        ];
      };
    };
  };
}
