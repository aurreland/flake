{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  cfg = config.aurel.programs.gpg;
in {
  options.aurel.programs.gpg = {
    enable =
      lib.mkEnableOption "GnuPG configuration"
      // {
        default = config.aurel.enable;
        defaultText = lib.literalExpression "config.aurel.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      pinentryPackage = osConfig.programs.gnupg.agent.pinentryPackage or pkgs.pinentry-curses;
    };
  };
}
