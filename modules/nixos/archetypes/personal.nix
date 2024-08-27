{
  config,
  lib,
  ...
}: let
  cfg = config.archetypes.personal;
in {
  options.archetypes = {
    personal.enable = lib.mkEnableOption "the \"Personal\" archetype";
  };

  config = lib.mkIf cfg.enable {
    base.enable = true;

    traits = {
      home-manager.enable = true;

      locale = {
        fr_FR.enable = true;
        FR.enable = true;
      };

      users = {
        aurel.enable = true;
      };
    };
  };
}
