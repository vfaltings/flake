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

  home.file.".config/qutebrowser" = {
    source = ../../dotfiles/qutebrowser;
    recursive = true;
  };
}
