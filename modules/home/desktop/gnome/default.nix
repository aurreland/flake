{
  lib,
  config,
  osConfig,
  ...
}: let
  enable = osConfig.services.xserver.desktopManager.gnome.enable or false;
in {
  config = lib.mkIf enable {
    desktop.gtk.enable = true;

    dconf = {
      enable = true;
      settings = {};
    };
  };
}
