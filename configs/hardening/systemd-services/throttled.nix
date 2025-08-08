{
  systemd.services.throttled.serviceConfig = {
    PrivateNetwork = true;
    RestrictAddressFamilies = [];
    IPAddressDeny = "any";
    ProtectHome = true;
    PrivateTmp = true;
    MemoryDenyWriteExecute=true;
  };
}
