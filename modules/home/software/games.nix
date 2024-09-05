{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.software.games;
in {
  options.software.games = {
    enable =
      lib.mkEnableOption "Games configuration";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      steam
    ];
  };
}
