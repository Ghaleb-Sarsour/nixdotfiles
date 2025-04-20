{config, pkgs, ...}: 

{

  programs.dconf.enable = true;

  users.users.ext4.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-spice
    win-virtio
    adwaita-icon-theme
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}
