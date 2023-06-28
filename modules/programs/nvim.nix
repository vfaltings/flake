#
# Neovim text editor
# 
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./nvim.nix *
#

{ pkgs, pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
