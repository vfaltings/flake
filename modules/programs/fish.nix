#
# Qutebrowser
#
# flake.nix
# └─ ./modules
#    └─ ./programs
#       └─ ./fish.nix *
#

{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };   
      }
    ];
    shellInit = ''
      set fish_greeting ""
      set -U EDITOR vim
      set -U fish_color_normal CBCCC6
      set -U fish_color_command 5CCFE6
      set -U fish_color_quote BAE67E
      set -U fish_color_redirection D4BFFF
      set -U fish_color_end F29E74
      set -U fish_color_error FF3333
      set -U fish_color_param CBCCC6
      set -U fish_color_comment 5C6773
      set -U fish_color_match F28779
      set -U fish_color_selection --background=FFCC66
      set -U fish_color_search_match --background=FFCC66
      set -U fish_color_history_current --bold
      set -U fish_color_operator FFCC66
      set -U fish_color_escape 95E6CB
      set -U fish_color_cwd 73D0FF
      set -U fish_color_cwd_root red
      set -U fish_color_valid_path --underline
      set -U fish_color_autosuggestion 707A8C
      set -U fish_color_user brgreen
      set -U fish_color_host normal
      set -U fish_color_cancel --reverse
      set -U fish_pager_color_prefix normal --bold --underline
      set -U fish_pager_color_progress brwhite --background=cyan
      set -U fish_pager_color_completion normal
      set -U fish_pager_color_description B3A06D
      set -U fish_pager_color_selected_background --background=FFCC66
      set -U fish_color_host_remote 
      set -U fish_pager_color_secondary_completion 
      set -U fish_pager_color_selected_description 
      set -U fish_color_option 
      set -U fish_pager_color_secondary_description 
      set -U fish_pager_color_selected_prefix 
      set -U fish_pager_color_secondary_prefix 
      set -U fish_pager_color_selected_completion 
      set -U fish_pager_color_background 
      set -U fish_pager_color_secondary_background 
      set -U fish_color_keyword 
    '';
  };
}
