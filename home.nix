{ lib, config, pkgs, pkgs-stable, nixvim, ... }:

# Scripts
let
  myswaylock = pkgs.writeShellScriptBin "myswaylock" ''
    swaylock  \
           --indicator \
           --clock \
           --timestr "%H:%M" \
           -i ~/.config/wallpapers/foggy-valley.jpg \
           --bs-hl-color fad07b \
           --font "SF Pro Bold" \
           --indicator-radius 80 \
           --indicator-thickness 7 \
           --inside-color 212733f0 \
           --inside-clear-color fad07bf0 \
           --inside-ver-color 6dcbfaf0 \
           --inside-wrong-color ed8274f0 \
           --key-hl-color fad07b \
           --line-color 00000000 \
           --separator-color 212733 \
           --ring-color 191e2a \
           --ring-clear-color ffd580 \
           --ring-ver-color 73d0ff \
           --ring-wrong-color f28779 \
           --text-color fad07b \
           --effect-vignette 0.6:1 \
           --effect-blur 20x2 \
           --grace 5 \
  '';
in
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
    gnupg
    pass
    tree
    which
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
    spotify
    spotify-tui

    # hyprland stuff
    brightnessctl
    wofi
    dunst
    libnotify
    eww-wayland
    swaybg
    swaylock-effects
    myswaylock
    swayidle

    python3
    jq
    playerctl

    nodejs_20
    rustup
    python311Packages.pip
  ];

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
