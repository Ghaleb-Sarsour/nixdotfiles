{ config, pkgs, pkgs-stable, inputs, nixpkgs-stable, lib, ... }:

{

  hardware.xpadneo.enable = true;
  hardware.steam-hardware.enable = true;
  # hardware.xone.enable = true;

  services.displayManager.ly =  {
    enable = true;
  };

  environment.systemPackages = 

    #Unstable Programs
    (with pkgs; [

      protontricks
      protonup-qt
      librewolf 
      wireshark

      kdePackages.kdeconnect-kde

      # Performance/Undervolting
      stress
      s-tui
      linuxKernel.packages.linux_6_12.cpupower

      #Benchmarks
      kdiskmark
      furmark

      rustlings

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
      btop
      blender
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
      hyprsunset
      mailspring
      ncdu
      neovide
      neovim
      nextcloud-client
      obs-studio
      onlyoffice-bin
      openvpn3
      pavucontrol
      qutebrowser
      scrcpy
      sc-im
      swaynotificationcenter
      tofi
      vimiv-qt
      vlc
      vscode
      wezterm
      yazi
      zathura
      zenity


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


  #Used for hyprpanel battery indicator
  services.upower.enable = true;

  virtualisation.waydroid.enable = true;


  #Steam
  programs.steam.enable = true;

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
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
  #       user = "greeter";
  #     };
  #   };
  # };
  # systemd.services.greetd.serviceConfig = {
  #   Type = "idle";
  #   StandardInput = "tty";
  #   StandardOutput = "tty";
  #   StandardError = "journal";
  #   TTYReset = true;
  #   TTYVHangup = true;
  #   TTYVTDisallocate = true;
  # };

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
