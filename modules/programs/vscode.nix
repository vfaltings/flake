#
# Qutebrowser
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./vscode.nix *
#

{ pkgs, ... }:

{
  programs.vscode = {
    enable = true; 
    package = pkgs.vscode.fhs;
  };
}
