{
  systemd.services.display-manager.serviceConfig = {
    ProtectKernelTunables = true;
    ProtectKernelModules = true; 
    ProtectKernelLogs = true;

    ProtectClock = true;
    PrivateTMP = true;
    MemoryDenyWriteExecute = true;
    SystemCallArchitectures = "native";
    LockPersonality = true;
    SystemCallErrorNumber = "EPERM"; 
    SystemCallFilter = [
      "~@keyring"
      "~@swap"
      "~@debug"
      "~@module"
      "~@obsolete" 
      "~@cpu-emulation"  
    ];
  };
}
