{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Better core utils
    eza # ls replacement
    fd # find replacement
    ripgrep # grep replacement

    ## Tools / useful cli
    ## Utilities
    wiremix
    playerctl # controller for media players
    poweralertd
    udiskie # Automounter for removable media
    unzip
    wget
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
    lazydocker
  ];
}
