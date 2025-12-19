{ pkgs, username, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "ryanzomorrodi";
        email = "rzomor2@uic.edu";
      };

      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;

      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    gh
  ];
}
