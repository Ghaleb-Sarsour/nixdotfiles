{ config, pkgs, pkgs-stable, nixpkgs-stable, ... }:

{
  environment.systemPackages = 
    #Unstable Programs
    (with pkgs; [
      flutter
      dart

      # LSP's for Neovim
      jdt-language-server
      rust-analyzer
      nil
      typescript-language-server
      lua-language-server
      python313Packages.python-lsp-server

      android-file-transfer
      android-tools
      bluetuith
      brightnessctl
      btop
      cargo
      checkstyle
      chafa
      chromium
      corefonts
      curl
      discord
      dmidecode 
      dotnetCorePackages.dotnet_9.sdk
      fastfetch
      fd
      ffmpeg
      firefox
      fzf
      gcc
      geckodriver
      git
      git-lfs
      glib
      gnumake
      go
      gparted
      greetd.tuigreet
      helix
      htop
      hyprcursor
      hyprlock
      hyprpanel
      hyprshade
      hyprshot
      hyprsunset
      inetutils
      imagemagick
      ipfetch
      jdk
      libgcc
      librsvg
      linuxKernel.packages.linux_6_6.vmware
      lua51Packages.lua
      luajitPackages.luarocks-nix
      luajitPackages.magick
      mono
      neovide
      neovim
      networkmanager-openvpn
      networkmanagerapplet
      nextcloud-client
      nh
      nodejs_22
      obs-studio
      onlyoffice-bin
      openvpn3
      p7zip
      pavucontrol
      php
      php81Packages.composer
      pnpm
      python313
      python313Packages.cmake
      python313Packages.pip
      rar
      ripgrep
      root
      rofi-wayland
      ruby
      rustc
      rustup
      scrcpy
      starship
      steam-run
      steam-fhsenv-without-steam
      sqlite
      swaynotificationcenter
      swww
      texliveMedium
      tmux
      tree-sitter
      typescript
      unityhub
      unzip
      vimiv-qt
      vistafonts
      vlc
      vscode
      # waybar
      wezterm
      wget
      wineWowPackages.stable
      wl-clipboard
      wordnet
      xdg-desktop-portal
      xorg.xhost
      yazi
      zathura
      zip
  ])

  ++
  #Stable Packages
  (with pkgs-stable; [
    hollywood
    # davinci-resolve
  ]);
 
  services.upower.enable = true;

  services.flatpak.enable = true;

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
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
