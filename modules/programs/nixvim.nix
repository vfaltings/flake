#
# Nix neovim plugin manager
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./nixvim.nix *
#

{ pkgs, pkgs-unstable, ... }:

{
  programs.nixvim = {
    enable = true;

    extraPlugins = [ pkgs.vimPlugins.neovim-ayu ];

    viAlias = true;
    vimAlias = true;

    plugins.lightline.enable = true;
    plugins.nvim-tree.enable = true;
  };
}
