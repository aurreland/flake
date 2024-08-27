{
  config,
  lib,
  ...
}: let
  cfg = config.traits.locale;
in {
  options.traits.locale = {
    FR = {
      enable = lib.mkEnableOption "france locale";
    };
  };

  config = lib.mkMerge [(lib.mkIf cfg.FR.enable {time.timeZone = "Europe/Paris";})];
}
