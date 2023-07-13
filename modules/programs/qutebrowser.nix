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

    keyBindings = {
      normal = {
        "J" = "tab-prev";
        "K" = "tab-next";
      };
    };
  };
}
