{
  lib,
  pkgs,
  osConfig,
  ...
}: let
  enable = osConfig.services.displayManager.cosmic.enable or false;
in {
  config = lib.mkIf enable {
    home = {
      packages = with pkgs; [
        adw-gtk3
        qadwaitadecorations
        qadwaitadecorations-qt6
      ];

      sessionVariables = {
        QT_WAYLAND_DECORATION = "adwaita";
      };
    };

    dconf = {
      enable = true;
      settings = {};
    };

    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        size = 24;
        package = pkgs.bibata-cursors;
      };
    };
  };
}
