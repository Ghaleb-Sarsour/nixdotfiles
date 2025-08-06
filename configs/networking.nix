{ config, pkgs, ... }:

{
  #Networking
  networking = {
    hostName = "Ext4-NixOS";
    networkmanager.enable = true;
  };

  #Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;
  
  #Printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
