{
  config,
  lib,
  ...
}: let
  cfg = config.base.aurel;
in {
  options.base.aurel = {
    enable = lib.mkEnableOption "aurel's home configuration";
  };

  imports = [./standalone.nix];

  config = lib.mkIf cfg.enable {home.stateVersion = "23.11";};
}
