{ config, pkgs, ...}:

{
  imports = [
    ./systemd-services/NetworkManager-dispatcher.nix #1
    ./systemd-services/NetworkManager.nix #1
    ./systemd-services/nscd.nix #1
    ./systemd-services/wpa_supplicant.nix #1
    ./systemd-services/bluetooth.nix
    ./systemd-services/cups.nix
    ./systemd-services/dbus.nix
    ./systemd-services/getty.nix
    ./systemd-services/libvertd.nix
    ./systemd-services/nix-daemon.nix
    ./systemd-services/nix-optimise.nix
    ./systemd-services/reload-systemd-vconsole-setup.nix
    ./systemd-services/rescue.nix
    ./systemd-services/rtkit.nix
    ./systemd-services/sshd.nix
    ./systemd-services/systemd-ask-password-console.nix
    ./systemd-services/systemd-ask-password-wall.nix
    ./systemd-services/systemd-journald.nix
    ./systemd-services/systemd-machined.nix
    ./systemd-services/user.nix
  ];
  systemd.services.cups-browsed.enable = false; # Disable cups-browsed service
  users.groups.netdev = {};
  services = {
    dbus.implementation = "broker";
    logrotate.enable = true;
    journald = {
      storage = "volatile"; # Store logs in memory
      upload.enable = false; # Disable remote log upload (the default)
      extraConfig = ''
        SystemMaxUse=500M
        SystemMaxFileSize=50M
      '';
    };
  };

}
