{ config, pkgs, pkgs-stable, inputs, nixpkgs-stable, lib, ... }:

{
  environment.systemPackages = 

    #Unstable Programs
    (with pkgs; [

      #Customization
      nwg-look
      python313Packages.dbus-python
      python312Packages.dbus-python

      #VPN
      wireguard-tools

      # Performance/Undervolting
      s-tui
      linuxKernel.packages.linux_6_12.cpupower

      #Security
      lynis
      chkrootkit
      aide

      # Languages
      go
      lua51Packages.lua
      nodejs_22
      jdk23
      javaPackages.openjfx23
      typescript
      sqlite
      ruby
      python313
      rust-analyzer
      rustfmt
      mold
      rocmPackages.llvm.clang 
      php
      dotnetCorePackages.dotnet_9.sdk
      mono

      # LSPs
      clippy
      jdt-language-server
      nil
      typescript-language-server
      lua-language-server
      pylyzer

      # Programs
      android-tools
      bitwarden
      btop
      chromium
      cmatrix
      discord
      fastfetch
      gparted
      htop
      hyprcursor
      hyprlock
      hyprpanel
      hyprpaper
      hyprshade
      hyprshot
      kdePackages.kdeconnect-kde
      librewolf 
      mailspring
      ncdu
      neovide
      neovim
      nextcloud-client
      obs-studio
      onlyoffice-bin
      pavucontrol
      protonup-qt
      sbctl
      scrcpy
      sc-im
      tofi
      vimiv-qt
      vlc
      vscode
      wezterm
      yazi
      zathura

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
      libnotify
      librsvg
      libvirt-glib
      luajitPackages.magick
      networkmanager-openvpn
      networkmanagerapplet
      nh
      p7zip
      php81Packages.composer
      pnpm
      python312Packages.adblock
      python313Packages.cmake
      python313Packages.pip
      rar
      ripgrep
      root
      starship
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
    davinci-resolve
    texliveMedium
    prismlauncher
  ]);
 
  #Flatpaks
  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true; 
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ]; 

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    corefonts
    vistafonts
  ];

  #Gamepad Settings
  hardware.xpadneo.enable = true;
  hardware.steam-hardware.enable = true;
  services.pcscd.enable = true;

  #Used for hyprpanel battery indicator
  services.upower.enable = true;

  #Steam
  programs.steam.enable = true;

  #Zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  
  #keyring 
  services.gnome.gnome-keyring.enable = true;

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
