#
# Starship prompt
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./starship.nix *
#

{ pkgs, pkgs-unstable, ... }:

{
  programs.starship = {
    enable = true;
    options = {
      format = ''$character'';
      right_format = ''$all'';
    };
  };
}
