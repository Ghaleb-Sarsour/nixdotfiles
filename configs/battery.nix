{ config, pkgs, ... }:

{
  services = { 
    power-profiles-daemon.enable = false;  
    thermald.enable = true; 
    system76-scheduler = {
      enable = true;
      useStockConfig = true;
      settings.cfsProfiles.enable = true;
    };
    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        # START_CHARGE_THRESH_BAT0 = 80;
        # STOP_CHARGE_THRESH_BAT0 = 100;
      };
    };
  };

  services.logind.lidSwitch = "sleep";
}
