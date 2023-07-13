{ lib, config, pkgs, pkgs-stable, nixvim, ... }:

{
  imports = (import ./modules/programs) ++ (import ./modules/services);

  home.username = "victor";
  home.homeDirectory = "/home/victor";

  #Add support for ./local/bin
  # Just to use lvim
  # Remove once neovim configured
  home.sessionPath = [
  "$HOME/.local/bin"
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  programs.fish = {
    enable = true;
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

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    ranger # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
    tldr

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    file
    which
    tree
    # gnused
    # gnutar
    # gawk
    # zstd
    # gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix
    # with more details log output
    # nix-output-monitor

    # productivity
    glow # markdown previewer in terminal
    teams

    htop
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # apps
    # discord
    spotify

    # hyprland stuff
    wofi
    dunst
    eww-wayland
    swaybg

    python3
    jq
    playerctl

    nodejs_20
    rustup
    python311Packages.pip
  ];

  # Vencord
  # nixpkgs.overlays =
  #   let
  #     discordOverlay = self: super: {
  #       discord = super.discord.override { withOpenASAR = true; withVencord = true; };
  #     };
  #   in
  #   [ discordOverlay ];


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
