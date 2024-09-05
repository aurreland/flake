{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.traits.users.aurel;
in {
  options.traits.users.aurel = {
    enable = lib.mkEnableOption "Aurel's user & home configurations";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      home-manager.backupFileExtension = "backup";
      home-manager.users.aurel = {
        imports = [(inputs.self + "/users/aurel/home.nix")];
      };
    })

    (lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
      users.users.aurel = {
        extraGroups = ["wheel"];
        isNormalUser = true;
      };
    })
  ];
}
