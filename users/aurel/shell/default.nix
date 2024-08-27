{
  config,
  lib,
  ...
}: let
  cfg = config.aurel.shell;
in {
  options.aurel.shell = {
    aliases.enable =
      lib.mkEnableOption "shell aliases"
      // {
        default = config.aurel.enable;
        defaultText = lib.literalExpression "config.aurel.enable";
      };

    variables.enable =
      lib.mkEnableOption "shell variables"
      // {
        default = config.aurel.enable;
        defaultText = lib.literalExpression "config.aurel.enable";
      };
  };

  imports = [./fish.nix];

  config = {
    home = lib.mkMerge [
      (lib.mkIf cfg.variables.enable {
        sessionVariables = rec {
          EDITOR = "nvim";
          VISUAL = EDITOR;
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
  };
}
