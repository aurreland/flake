{
  lib,
  osConfig,
  ...
}: let
  enable = osConfig.services.displayManager.cosmic.enable or false;
in {
  config = lib.mkIf enable {
    desktop.gtk.enable = true;

    dconf = {
      enable = true;
      settings = {};
    };
  };
}
