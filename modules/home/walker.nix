{ inputs, ... }:
{
  imports = [ inputs.walker.homeManagerModules.walker ];

  programs.walker = {
    enable = true;
    runAsService = true;
  };

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
  xdg.dataFile."applications/zoom.desktop".text = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Zoom
    Exec=chromium --enable-features=WebContentsForceDark --app=https://app.zoom.us
    Icon=zoom
    Terminal=false
    Categories=Network;VideoConference;
  '';
  home.file.".icons/hicolor".source = ../../assets/hicolor;

  xdg.dataFile."applications/blueberry.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
  xdg.dataFile."applications/org.rnd2.cpupower_gui.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
  xdg.dataFile."applications/remote-viewer.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';
  xdg.dataFile."applications/nm-connection-editor.desktop".text = ''
    [Desktop Entry]
    Hidden=true
  '';

  home.file.".config/walker".source = ../../config/walker;
}
