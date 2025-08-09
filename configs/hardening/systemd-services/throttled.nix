{
  systemd.services.throttled.serviceConfig = {
    PrivateNetwork = true;
    RestrictAddressFamilies = [
      "~AF_INET"
      "~AF_INET6"
      "~AF_PACKET"
    ];
    IPAddressDeny = "any";
    ProtectHome = true;
    PrivateMounts = true;
    PrivateTmp = true;
    ProtectControlGroups = true;
    ProtectSystem = "strict";
    ProtectClock = true;
    ProtectKernelLogs = true;
    RestrictNamespaces = true;
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    SystemCallArchitectures = "native";
    LockPersonality = true;
    NoNewPrivileges = true;
    RestrictSUIDSGID = true;
    SystemCallErrorNumber = "EPERM"; 
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
  };
}
