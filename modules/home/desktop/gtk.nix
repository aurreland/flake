{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktop.gtk;
in {
  options.desktop.gtk = {
    enable = lib.mkEnableOption "Gtk configuration";
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    {
      gtk = {
        enable = true;
        cursorTheme = {
          name = "Bibata-Modern-Ice";
          size = 24;
          package = pkgs.bibata-cursors;
        };
      };
    }
    (lib.mkIf (!config.stylix.enable) {
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
      gtk.theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    })
  ]);
}
