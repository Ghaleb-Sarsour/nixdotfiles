{ config, pkgs, pkgs-stable, nixpkgs-stable, ... }:

{
  environment.systemPackages = 
    #Unstable Programs
    (with pkgs; [
      bluetuith
      brightnessctl
      cargo
      chromium
      corefonts
      curl
      discord
      dotnetCorePackages.sdk_8_0_3xx
      emacs
      fastfetch
      fd
      firefox
      fzf
      gcc
      geckodriver
      git
      gnumake
      go
      greetd.tuigreet
      htop
      hyprlock
      hyprshot
      inetutils
      ipfetch
      jdk
      kitty
      libgcc
      linuxKernel.packages.linux_6_6.vmware
      lua51Packages.lua
      luajitPackages.luarocks-nix
      nextcloud-client
      neovim
      nodejs_22
      obs-studio
      onlyoffice-bin
      openvpn3
      php
      php81Packages.composer
      pnpm
      python3
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
      swaynotificationcenter
      swww
      tmux
      tree-sitter
      typescript
      unzip
      vistafonts
      vlc
      waybar
      wget
      wl-clipboard
      yazi
      zathura
      zip
  ])

  ++
  #Stable Packages
  (with pkgs-stable; [
    hollywood
    julia_19
    rocmPackages_5.llvm.clang
    unityhub
  ]);
  
  #Emacs Daemon
  services.emacs.enable = true;

  #Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
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
