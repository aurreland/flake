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
      users.users.aurel.shell = pkgs.fish;

      programs.fish.enable = true;

      home-manager.users.aurel = {
        imports = [(inputs.self + "/users/aurel")];
        aurel = {
          enable = true;
          shell.fish.enable = true;
        };
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
