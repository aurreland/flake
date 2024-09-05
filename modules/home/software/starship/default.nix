{
  config,
  lib,
  ...
}: let
  cfg = config.software.starship;
in {
  options.software.starship = {
    enable =
      lib.mkEnableOption "Starship configuration";
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
