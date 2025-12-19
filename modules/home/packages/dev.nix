{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Lsp
    nil

    ## formating
    nixpkgs-fmt
    nixfmt-rfc-style

    ## C / C++
    gcc
    cmake
    gnumake

    ## Python
    python3
    python312Packages.ipython
  ];
}
