#
# Qutebrowser
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./qutebrowser.nix *
# └─ ./dotfiles
#    └─ ./qutebrowser
#

{ pkgs, ... }:

{
  programs.exa = {
    enable = true; 
    enableAliases = true;
    icons = true;
  };
}
