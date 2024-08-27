{
  config,
  lib,
  ...
}: let
  cfg = config.aurel.standalone;
  enable = config.aurel.enable && cfg.enable;
in {
  options.aurel.standalone = {
    enable = lib.mkEnableOption "standalone configuration options";
  };

  config = lib.mkIf enable {
    _module.args.osConfig = {};
    programs.home-manager.enable = true;

    home = {
      username = "aurel";
      homeDirectory = "/home/${config.home.username}";
    };
  };
}
