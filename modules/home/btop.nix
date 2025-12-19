{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  home.file.".config/btop".source = ../../config/btop;

  xdg.dataFile."applications/btop.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}
