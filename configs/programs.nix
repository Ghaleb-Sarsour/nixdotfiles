{ config, pkgs, ... }:

{

  #Programs
  environment.systemPackages = with pkgs; [
    bluetuith
    brightnessctl
    cargo
    chromium
    corefonts
    curl
    discord
    dotnetCorePackages.sdk_8_0_3xx
    fastfetch
    firefox
    geckodriver
    git
    gnumake
    go
    greetd.tuigreet
    hollywood
    htop
    hyprlock
    hyprshot
    inetutils
    ipfetch
    jdk
    #julia_19
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
    pnpm
    python3
    python312Packages.cmake
    python312Packages.pip
    rar
    ripgrep
    #rocmPackages_5.llvm.clang
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
    #unityhub
    unzip
    vistafonts
    vlc
    waybar
    wget
    wl-clipboard
    yazi
    zathura
    zip
  ];

  
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

}
