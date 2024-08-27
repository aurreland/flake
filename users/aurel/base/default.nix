{
  config,
  lib,
  ...
}: let
  cfg = config.aurel;
in {
  options.aurel = {
    enable = lib.mkEnableOption "aurel's home configuration";
  };

  imports = [./standalone.nix];

  config = lib.mkIf cfg.enable {home.stateVersion = "23.11";};
}
