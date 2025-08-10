{...}: 

{
  networking.nftables = {
    enable = true;

    ruleset = ''
      table inet filter {
        chain output {
          # Allow localhost DNS for dnscrypt-proxy2
          ip daddr 127.0.0.1 udp dport 53 accept
          ip6 daddr ::1 udp dport 53 accept
          ip daddr 127.0.0.1 tcp dport 53 accept
          ip6 daddr ::1 tcp dport 53 accept
          # Allow dnscrypt-proxy2 to talk to upstream
          # ps -o uid,user,pid,cmd -C dnscrypt-proxy; Copy UID #
          meta skuid 62396 udp dport { 443, 853 } accept
          meta skuid 62396 tcp dport { 443, 853 } accept
          # Block all other outbound DNS
          udp dport { 53, 853 } drop
          tcp dport { 53, 853 } drop
        }
      }
    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 
      53 # DNS
      22 # SSH
      80 # HTTP
      443 # HTTPS
    ];
    allowedUDPPorts = [
      53 # DNS
      51820 # Wireguard
    ];

    #KDE Connect
    allowedTCPPortRanges = [
      { from = 1714; to = 1764;}
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764;}
    ];
  };
}

