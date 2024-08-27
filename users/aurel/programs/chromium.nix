{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.aurel.programs.chromium;
in {
  options.aurel.programs.chromium = {
    enable =
      lib.mkEnableOption "Chromium configuration"
      // {
        default = config.aurel.desktop.enable;
        defaultText = lib.literalExpression "config.aurel.desktop.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;

      dictionaries = [pkgs.hunspellDictsChromium.en_US];

      extensions = [
        # ublock origin
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
        # bitwarden
        {id = "nngceckbapebfimnlniiiahkandclblb";}
        # floccus bookmark sync
        {id = "fnaicdffflnofjppbagibeoednhnbjhg";}
        # tabby cat
        {id = "mefhakmgclhhfbdadeojlkbllmecialg";}
      ];
    };
  };
}
