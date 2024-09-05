{
  config,
  lib,
  ...
}: let
  cfg = config.base.aurel.standalone;
  enable = config.base.aurel.enable && cfg.enable;
in {
  options.base.aurel.standalone = {
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
