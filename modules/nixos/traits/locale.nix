{
  config,
  lib,
  ...
}: let
  cfg = config.traits.locale;
in {
  options.traits.locale = {
    fr_FR = {
      enable = lib.mkEnableOption "fr_FR locale";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.fr_FR.enable {
      i18n = {
        supportedLocales = [
          "en_US.UTF-8/UTF-8"
          "fr_FR.UTF-8/UTF-8"
        ];

        defaultLocale = "fr_FR.UTF-8";
      };
    })
  ];
}
