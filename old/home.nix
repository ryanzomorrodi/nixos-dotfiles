{ pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/btop.nix
    ./modules/fastfetch.nix
    ./modules/nvim.nix
    ./modules/r.nix
    ./modules/theme.nix
    ./modules/walker.nix
    ./modules/waybar.nix
    ./modules/zen.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#vm";
      vim = "nvim";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  home.packages = with pkgs; [
    ripgrep
    gcc
    chromium
  ];

  xdg.dataFile."applications/nixos-manual.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
  xdg.dataFile."applications/uuctl.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
  xdg.dataFile."applications/chromium-browser.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}

