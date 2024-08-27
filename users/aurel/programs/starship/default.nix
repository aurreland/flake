{
  config,
  lib,
  ...
}: let
  cfg = config.aurel.programs.starship;
in {
  options.aurel.programs.starship = {
    enable =
      lib.mkEnableOption "Starship configuration"
      // {
        default = config.aurel.enable;
        defaultText = lib.literalExpression "config.aurel.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;

      settings =
        {
          format = "$all";
          command_timeout = 250;
        }
        // lib.importTOML ./starship.toml;
    };
  };
}
