{
  systemd.services."user@".serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateDevices = true;
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6";
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];  # Adjust based on user needs
    SystemCallArchitectures = "native";
    UMask = "0077";
    IPAddressDeny = "any";
  };
}
