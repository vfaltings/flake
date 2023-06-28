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

    viAlias = true;
    vimAlias = true;

    extraPlugins = with pkgs.vimPlugins; [ 
      neovim-ayu 
      vim-parinfer
    ];

    # Theme

    colorscheme = "ayu-mirage";

    # Options

    options = {
      number = true;
      relativenumber = true;
    };

    # Plugins

    plugins.lualine = {
      enable = true;
    };

    plugins.neo-tree.enable = true;

    # Languages
    plugins.lsp.enable = true;
    plugins.treesitter.enable = true;

    plugins.nix.enable = true;

    # Keybindings

    globals.mapleader = " ";

    maps = {
      normalVisualOp."<leader>e" = {
        action = "<cmd>NeoTreeFocusToggle<CR>";
      };
    };
  };
}
