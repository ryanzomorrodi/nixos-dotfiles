{ config, inputs, pkgs, ... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser =
    let
      mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
      });
      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });
    in
    {
      enable = true;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        Preferences = mkLockedAttrs {
          "browser.tabs.warnOnClose" = true;
        };
        ExtensionSettings = mkExtensionSettings {
          "addon@darkreader.org" = "darkreader";
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium-ff";
          "uBlock0@raymondhill.net" = "ublock-origin";
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
        };
      };
      profiles.default = {
        isDefault = true;
        settings = {
          "zen.tabs.show-newtab-vertical" = false;
          "zen.urlbar.behavior" = "float";
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.toolbar-flash-popup" = true;
          "zen.view.show-newtab-button-top" = false;
          "zen.tabs.vertical.right-side" = true;
          "zen.view.window.scheme" = 0;
          "zen.welcome-screen.seen" = true;
          "zen.workspaces.continue-where-left-off" = true;
          "zen.view.show-clear-tabs-button" = false;
        };
        search = {
          force = true;
          default = "google";
        };
      };
    };


  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.${pkgs.system}.beta;
        in
        zen-browser.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map (name: { inherit name value; }) [
          "application/x-extension-shtml"
          "application/x-extension-xhtml"
          "application/x-extension-html"
          "application/x-extension-xht"
          "application/x-extension-htm"
          "x-scheme-handler/unknown"
          "x-scheme-handler/mailto"
          "x-scheme-handler/chrome"
          "x-scheme-handler/about"
          "x-scheme-handler/https"
          "x-scheme-handler/http"
          "application/xhtml+xml"
          "application/json"
          "text/html"
        ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };
}
