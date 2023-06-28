#
# Hyprland window manager
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./hyprland.nix *
# └─ ./dotfiles
#    └─ ./hypr
#

{ pkgs, ... }:

{
  home.file.".config/hypr" = {
    source = ../../dotfiles/hypr;
    recursive = true;
  };
}
