{ pkgs, pkgs-stable, ... }:

{
  programs.git = {
    enable = true;
    userName = "Victor Faltings";
    userEmail = "victor.faltings@gmail.com";
  };
}
