{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  cfg = config.software.gpg;
in {
  options.software.gpg = {
    enable =
      lib.mkEnableOption "GnuPG configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.gpg.enable = true;

    services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      pinentryPackage = osConfig.programs.gnupg.agent.pinentryPackage or pkgs.pinentry-curses;
    };
  };
}
