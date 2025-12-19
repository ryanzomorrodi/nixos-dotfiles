{ lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.enable = true;
  services.xserver.windowManager.hyprland.enable = true;
  services.xserver.displayManager.gdm.autoLogin.enable = true;
  services.xserver.displayManager.gdm.autoLogin.user = "user";

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    nautilus
  ];
  services.gvfs.enable = true;

  programs.chromium = {
    enable = true;
    extraOpts = {
      "WebAppInstallForceList" = [
        {
          "custom_name" = "Zoom";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://app.zoom.us";
        }
      ];
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}

