{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}: let
  cfg = config.desktop;
in {
  options.desktop = {
    enable =
      lib.mkEnableOption "desktop (Linux) settings"
      // {
        default = osConfig.desktop.enable or false;
        defaultText = lib.literalExpression "osConfig.desktop.enable or false";
      };
  };

  imports = [
    ./gtk.nix
    ./stylix.nix

    ./cosmic
    ./gnome
    ./niri
  ];

  config = lib.mkIf cfg.enable {
    assertions = [(lib.hm.assertions.assertPlatform "desktop" pkgs lib.platforms.linux)];

    home.packages = with pkgs; [
      armcord
      element-desktop
      (prismlauncher.override {withWaylandGLFW = true;})
    ];
  };
}
