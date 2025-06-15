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
    # allowedTCPPorts = [ 80 443 22 53 21 20 8006 3389 ];
    allowedTCPPorts = [22 443 25565];
    allowedTCPPortRanges = [
      { from = 1714; to = 1764;}
    ];
    # allowedUDPPorts = [ 3389 ];
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
  
  
