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
  programs.qutebrowser = {
    enable = true; 
  };
}
