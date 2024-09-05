{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.desktop.niri;
in {
  options.desktop.niri.enable = lib.mkEnableOption "NIRI desktop";

  imports = [inputs.niri.nixosModules.niri];

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };
    services.xserver.displayManager.gdm.enable = true;
    environment.systemPackages = with pkgs; [kitty];
  };
}
