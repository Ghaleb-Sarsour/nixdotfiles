{
  systemd.services.display-manager.serviceConfig = {
    ProtectKernelTunables = true;
    ProtectKernelModules = true; 
    ProtectKernelLogs = true;
  };
}
