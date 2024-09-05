{
  config,
  lib,
  ...
}: let
  cfg = config.software.terminal;
in {
  options.software.terminal.default = lib.mkOption {
    type = lib.types.str;
    description = "Default Terminal";
    default = null;
  };

  imports = [
    ./kitty.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (cfg.default == "kitty") {
      software.terminal.kitty.enable = true;
    })
  ];
}
