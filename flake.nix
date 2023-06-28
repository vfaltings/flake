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
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # Official NixOS package source, unstable branch used by default
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Official NixOS package source, stable branch for potential backups
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, 
    nixpkgs, 
    nixpkgs-stable, 
    home-manager, 
  ... }@inputs: {
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
        };

        modules = [
          # NixOS system configuration
          ./configuration.nix

          # Home-manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.victor = {
              imports = [ ./home.nix ];
            };
          }
        ];
      };
    };
  };
}
