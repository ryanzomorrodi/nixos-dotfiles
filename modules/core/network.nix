{ host, pkgs, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openconnect
      ];
    };
  };

  environment.systemPackages = [
    pkgs.openconnect
    pkgs.networkmanagerapplet
  ];
}

