{ ... }:
{
  security = {
    rtkit.enable = true;
    sudo.enable = true;

    pam.services = {
      hyprlock = { };
    };
  };

  nix.settings.ssl-cert-file = "/etc/ssl/certs/ca-bundle.crt";
}

