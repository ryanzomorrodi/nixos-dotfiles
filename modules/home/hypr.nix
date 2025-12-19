{ pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
  };

  home.packages = with pkgs; [
    hyprpaper
    hyprshot
    hyprpicker
  ];

  home.file = {
    ".config/hypr" = {
      source = ../../config/hypr;
    };
    "Pictures/02-bg-felix.png" = {
      source = ../../assets/02-bg-felix.png;
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    __GL_GSYNC_ALLOWED = 0;
    __GL_VRR_ALLOWED = 0;
    DISABLE_QT5_COMPAT = 0;
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = 1;
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = 1;
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = 1;
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GRIMBLAST_HIDE_CURSOR = 0;
    HYPRSHOT_DIR = "Pictures";
  };
}

