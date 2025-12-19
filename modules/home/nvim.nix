{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    nil
    nixpkgs-fmt
  ];

  home.file.".config/nvim".source = ../../config/nvim;

  xdg.dataFile."applications/nvim.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
}

