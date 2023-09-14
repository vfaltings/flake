#
# Qutebrowser
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./exa.nix *
#

{ pkgs, ... }:

{
  programs.eza = {
    enable = true; 
    enableAliases = true;
    icons = true;
  };
}
