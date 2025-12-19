{ pkgs, ... }:

let
  modifiedRWrapper = (pkgs.rWrapper.override {
    packages = [
      pkgs.rPackages.rix
      pkgs.rPackages.devtools
      pkgs.rPackages.tidyverse
      pkgs.rPackages.httr2
      pkgs.rPackages.sf
      pkgs.rPackages.stars
      pkgs.rPackages.duckdb
      pkgs.rPackages.arrow
      pkgs.rPackages.tidycensus
      pkgs.rPackages.quarto
      pkgs.rPackages.bench
      pkgs.rPackages.lintr
    ];
  }).overrideAttrs (finalAttrs: previousAttrs: {
    buildCommand = previousAttrs.buildCommand + ''
      # Modify the R script to add the desired comment
      sed -i '2i# Shell wrapper for R executable' $out/bin/R
      sed -i '3iR_HOME_DIR=${pkgs.R}/lib/R' $out/bin/R
      sed -i '4iif test "''${R_HOME_DIR}" = "${pkgs.R}"; then' $out/bin/R
      sed -i '5i  :' $out/bin/R
      sed -i '6ifi' $out/bin/R
    '';
  });
in
{
  home.packages = with pkgs; [
    modifiedRWrapper
    positron-bin
    air-formatter
    jarl
  ];

  home.file = {
    "/.config/Positron/User/settings.json" = {
      source = ../../config/positron/settings.json;
    };
    "/.config/Positron/User/keybindings.json" = {
      source = ../../config/positron/keybindings.json;
    };
  };
}
