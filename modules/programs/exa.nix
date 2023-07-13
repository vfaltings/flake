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
  programs.exa = {
    enable = true; 
    enableAliases = true;
    icons = true;
  };
}
