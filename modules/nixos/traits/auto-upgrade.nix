{
  config,
  lib,
  ...
}: let
  cfg = config.traits.autoUpgrade;
in {
  options.traits.autoUpgrade = {
    enable = lib.mkEnableOption "automatic updates";
  };

  config = lib.mkIf cfg.enable {
    system.autoUpgrade = {
      enable = true;

      dates = lib.mkDefault "02:00";
      flake = "github:aurreland/flake#${config.networking.hostName}";
      flags = ["--refresh"];
    };
  };
}
