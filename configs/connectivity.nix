{ config, pkgs, ... }:

{
  
  #SSH
  services.openssh.enable = true;

  #Networking
  networking.networkmanager = {
    enable = true;
    dns = "dnsmasq";
  };
  services.dnsmasq = {
    enable = true;
    settings.bind-interfaces = true; 
  };
  networking.resolvconf.useLocalResolver = true;
  networking.nameservers = ["9.9.9.9"];

  #Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22 25565];

    #KDE Connect
    allowedTCPPortRanges = [
      { from = 1714; to = 1764;}
    ];
    allowedUDPPorts = [ ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764;}
    ];
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
  
  
