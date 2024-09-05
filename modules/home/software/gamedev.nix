{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.software.gamedev;
in {
  options.software.gamedev = {
    enable =
      lib.mkEnableOption "Gamedev configuration";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      godot_4
      blender
      inputs.self.packages.${pkgs.system}.material-maker
    ];
  };
}
