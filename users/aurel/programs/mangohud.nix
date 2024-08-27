{
  config,
  lib,
  ...
}: let
  cfg = config.aurel.programs.mangohud;
in {
  options.aurel.programs.mangohud = {
    enable =
      lib.mkEnableOption "MangoHud configuration"
      // {
        default = config.aurel.desktop.enable;
        defaultText = lib.literalExpression "config.aurel.desktop.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.mangohud = {
      enable = true;
      settings = {
        cpu_stats = true;
        cpu_temp = true;
        gpu_stats = true;
        gpu_temp = true;
        fps = true;
        frametime = true;
        media_player = true;
        media_player_name = "spotify";
      };
    };
  };
}
