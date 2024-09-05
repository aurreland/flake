{
  config,
  lib,
  ...
}: let
  cfg = config.shell;
in {
  options.shell = {
    default = lib.mkOption {
      type = lib.types.str;
      default = null;
    };
    aliases.enable =
      lib.mkEnableOption "shell aliases"
      // {
        default = true;
      };

    variables.enable =
      lib.mkEnableOption "shell variables"
      // {
        default = true;
      };
  };

  imports = [./fish.nix];

  config = lib.mkMerge [
    {
      home = lib.mkMerge [
        (lib.mkIf cfg.variables.enable {
          sessionVariables = {
            CARGO_HOME = "${config.xdg.dataHome}/cargo";
            LESSHISTFILE = "${config.xdg.stateHome}/less/history";
          };
        })

        (lib.mkIf cfg.aliases.enable {
          shellAliases = {
            diff = "diff --color=auto";
            g = "git";
            gs = "g status";
          };
        })
      ];
    }
    (lib.mkIf (cfg.default == "fish") {
      shell.fish.enable = true;
    })
  ];
}
