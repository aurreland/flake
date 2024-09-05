{
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.desktop.stylix;
in {
  options.desktop.stylix = {
    enable = lib.mkEnableOption "stylix / environment styling";
  };
  imports = [inputs.stylix.nixosModules.stylix];

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      stylix = {
        enable = true;
        polarity = "dark";
        image = inputs.self + "/wallpaper.png";
        base16Scheme = inputs.self + "/theme.yaml";
        autoEnable = true;
        targets.gtk.enable = true;
      };
    })
    (lib.mkIf config.traits.users.aurel.enable {
      stylix = {
        homeManagerIntegration = {
          autoImport = true;
          followSystem = true;
        };
      };
    })
  ];
}
