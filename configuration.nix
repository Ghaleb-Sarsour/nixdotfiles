# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  #Import other config files
  imports =
    [
      ./hardware-configuration.nix
      ./configs/programs.nix
      ./configs/connectivity.nix
      ./configs/battery.nix
      ./configs/vm.nix
    ];
  
  #Persistent shells
  nix.extraOptions = ''
    keep-outputs = true
  '';

  #Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  #NTFS Support
  boot.supportedFilesystems = [ "ntfs" ];

  #Disable error reports in tty
  boot.kernelParams = [ 
    "quiet"
    "loglevel=0" 
    "console_loglevel=0"
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "esc";
            rightalt = "layer(layer1)";
            leftalt = "layer(layer1)";
          };
          layer1 = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
            capslock = "backspace";
            tab = "delete";
            n = "\"";
          };
        };
      };
    };
  }; 

  #Optimization
  nix.optimise = {
    automatic = true; # Optimize timer-based
  };
  nix.settings.auto-optimise-store = false; # Optimize during every rebuild
  
  #Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  #Updates
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
  };
  
  #GPU Settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver #For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME-iHD
    ];
  };

  #Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-8bf3a96c-aeee-4611-a317-4ac1e1fa9d82".device = "/dev/disk/by-uuid/8bf3a96c-aeee-4611-a317-4ac1e1fa9d82";
  networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #User Account
  users.users.ext4 = {
    isNormalUser = true;
    description = "ext4";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache/";
    XDG_CONFIG_HOME = "$HOME/.config/";
    XDG_DATA_HOME = "$HOME/.local/share/";
    XDG_STATE_HOME = "$HOME/.local/state/";
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
