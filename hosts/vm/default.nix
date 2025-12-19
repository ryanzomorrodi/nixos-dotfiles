{ lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = false;
}
