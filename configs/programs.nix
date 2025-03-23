{ config, pkgs, pkgs-stable, nixpkgs-stable, ... }:

{
  environment.systemPackages = 
    #Unstable Programs
    (with pkgs; [
      bluetuith
      brightnessctl
      btop
      cargo
      checkstyle
      chromium
      corefonts
      curl
      davinci-resolve
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
      hyprshade
      hyprshot
      inetutils
      imagemagick
      ipfetch
      jdk
      kitty
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
      pavucontrol
      php
      php81Packages.composer
      pnpm
      python312
      python312Packages.cmake
      python312Packages.pip
      qutebrowser
      rar
      ripgrep
      root
      rofi-wayland
      ruby
      rust-analyzer
      rustc
      rustup
      scrcpy
      starship
      steam-run
      steam-fhsenv-without-steam
      swaynotificationcenter
      swww
      texliveMedium
      tmux
      tree-sitter
      typescript
      unityhub
      unzip
      valent
      vimiv-qt
      vistafonts
      vlc
      vscode
      waybar
      wezterm
      wget
      wl-clipboard
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
    #julia_19
    #rocmPackages_5.llvm.clang
    #unityhub
  ]);
 
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

  #VPN
  programs.openvpn3.enable = true;

  #Vmware
  virtualisation.vmware.host.enable = true;

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
