#
# Terminal-UI Spotify client
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./ncspot.nix *
# └─ ./dotfiles
#    └─ ./ncspot
#

{ pkgs, ... }:

{
  programs.ncspot = {
    enable = true; 
  };

  # home.file.".config/ncspot" = {
  #   source = ../../dotfiles/ncspot;
  #   recursive = true;
  # };
}
