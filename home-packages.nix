{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    #anki
    #code-cursor
    #imv
    #mpv
    #obs-studio
    #obsidian
    #pavucontrol
    #teams-for-linux
    telegram-desktop
    #vesktop
    flameshot
    polybar

    # CLI utils
    #bc
    #bottom
    brightnessctl
    #cliphist
    #ffmpeg
    #ffmpegthumbnailer
    fzf
    #git-graph
    #grimblast
    htop
    #hyprpicker
    #ntfs3g
    #mediainfo
    #microfetch
    #playerctl
    ripgrep
    #showmethekey
    #silicon
    udisks
    #ueberzugpp
    unzip
    #w3m
    wget
    #wl-clipboard
    #wtype
    #yt-dlp
    zip
    xclip
    ranger

    # Coding stuff
    openjdk23
    nodejs
    #python311

    # WM stuff
    #libsForQt5.xwaylandvideobridge
    #libnotify
    #xdg-desktop-portal-gtk
    #xdg-desktop-portal-hyprland

    # Other
  ];
}
