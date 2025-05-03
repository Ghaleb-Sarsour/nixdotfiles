{ config, pkgs, pkgs-stable, inputs, nixpkgs-stable, lib, ... }:

{
  environment.systemPackages = 

    #Unstable Programs
    (with pkgs; [

      # Performance/Undervolting
      stress
      s-tui
      linuxKernel.packages.linux_6_12.cpupower

      # Languages
      go
      lua51Packages.lua
      nodejs_22
      flutter
      jdk23
      javaPackages.openjfx23
      typescript
      texliveMedium
      sqlite
      ruby
      python313
      rustc
      rust-analyzer
      cargo
      php
      dart
      dotnetCorePackages.dotnet_9.sdk
      mono

      # LSPs
      clippy
      rustfmt
      jdt-language-server
      nil
      typescript-language-server
      lua-language-server
      pylyzer
      checkstyle

      # Programs
      android-tools
      google-chrome
      btop
      blender
      cava
      chafa
      chromium
      cmatrix
      discord
      equibop
      firefox
      fastfetch
      gparted
      greetd.tuigreet
      htop
      hyprcursor
      hyprlock
      hyprpanel
      hyprshade
      hyprshot
      hyprsunset
      neovide
      neovim
      nextcloud-client
      obs-studio
      onlyoffice-bin
      openvpn3
      pavucontrol
      prismlauncher
      scrcpy
      sc-im
      shotcut
      swaynotificationcenter
      tofi
      unityhub
      vimiv-qt
      vlc
      vscode
      wezterm
      yazi
      zathura
      inputs.zen-browser.packages."${system}".default 

      #Benchmarks
      kdiskmark
      furmark

      # Other
      android-file-transfer
      android-tools
      bluetuith
      brightnessctl
      corefonts
      curl
      dmidecode 
      fd
      ffmpeg
      fzf
      gcc
      geckodriver
      git
      git-lfs
      glib
      gnumake
      inetutils
      imagemagick
      ipfetch
      libgcc
      librsvg
      luajitPackages.magick
      networkmanager-openvpn
      networkmanagerapplet
      nh
      p7zip
      php81Packages.composer
      pnpm
      python313Packages.cmake
      python313Packages.pip
      rar
      ripgrep
      root
      starship
      steam-run
      steam-fhsenv-without-steam
      tree-sitter
      unzip
      vistafonts
      wget
      wineWowPackages.stable
      wl-clipboard
      xdg-desktop-portal
      xorg.xhost
      zip
  ])

  ++
  #Stable Packages
  (with pkgs-stable; [
    hollywood
    # davinci-resolve
  ]);
 
  #Used for hyprpanel battery indicator
  services.upower.enable = true;

  services.flatpak.enable = true;

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    corefonts
    vistafonts
  ];

  #Zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  
  #Greeter
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  #keyring 
  services.gnome.gnome-keyring.enable = true;

  #VPN
  programs.openvpn3.enable = true;

  #Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "IHD";
    NIXOS_OZONE_WL = "1";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  #Allow unfree programs
  nixpkgs.config.allowUnfree = true;
}
