{ ... }:
{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./programs.nix
    ./pipewire.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
    ./vpn.nix
    ./wayland.nix
  ];
}
