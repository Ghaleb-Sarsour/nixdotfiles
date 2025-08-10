{ config, pkgs, ...}:

{

  environment.systemPackages = (with pkgs; [ wireguard-tools ]);

  # Enable WireGuard
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      ips = [ "10.100.0.3/32" ];
      listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/etc/wireguard/client-private.key";

      peers = [
        {
          # Public key of the server (not a file path).
          publicKey = "CNhMtfg6Lpze+2NbWZ8MPn/LvMBacCE1z1qTEQzdtE8=";

          # Forward all the traffic via VPN.
          allowedIPs = [ "0.0.0.0/0" ];

          # Set this to the server IP and port.
          endpoint = "uxt4.duckdns.org:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
