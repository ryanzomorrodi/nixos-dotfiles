{ pkgs, username, system, winapps, ... }:
{
  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" "docker" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    virtiofsd
    win-spice

    # winapps
    freerdp
    dialog
    winapps.packages.${system}.winapps
    winapps.packages.${system}.winapps-launcher
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
      };
    };
    docker = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  environment.variables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };
}

