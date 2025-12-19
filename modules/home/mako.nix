{ pkgs, lib, ... }: 

{
  services.mako.enable = false;
  
  home.packages = with pkgs; [
    libnotify mako 
  ];
  
  home.file.".config/mako".source = ../../config/mako;
}