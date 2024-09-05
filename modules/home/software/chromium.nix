{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.software.chromium;
in {
  options.software.chromium = {
    enable =
      lib.mkEnableOption "Chromium configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;

      dictionaries = [pkgs.hunspellDictsChromium.en_US];

      extensions = [
        # ublock origin
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
        # floccus bookmark sync
        {id = "fnaicdffflnofjppbagibeoednhnbjhg";}
      ];
    };
  };
}
