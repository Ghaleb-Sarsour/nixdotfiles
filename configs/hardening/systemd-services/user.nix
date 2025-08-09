{
  systemd.services."user@".serviceConfig = {
    NoNewPrivileges = true;

    LockPersonality = true; 
    ProtectControlGroups = true;
    ProcSubset = "pid"; 
    PrivateMounts = true; 
    ProtectHome = true;
 
    ProtectSystem = "strict";
    ProtectClock = true; 
    ProtectHostname = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectKernelLogs = true;
    ProtectProc = "invisible";
    PrivateTmp = true;
    PrivateNetwork = false;
    MemoryDenyWriteExecute = true;
    RestrictAddressFamilies = [ 
      "AF_UNIX" 
      "AF_NETLINK"
      "AF_BLUETOOTH"
      "AF_INET"
    ];
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    SystemCallFilter = [
      "~@keyring"
      "~@swap"
      "~@debug"
      "~@module"
      "~@obsolete" 
      "~@cpu-emulation" 
      "~@mount"
      "~@reboot"
    ];
    SystemCallArchitectures = "native";
    SystemCallErrorNumber = "EPERM"; 
  };
}
