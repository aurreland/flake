{
  config,
  lib,
  ...
}: let
  cfg = config.software.editor;
in {
  options.software.editor.default = lib.mkOption {
    type = lib.types.str;
    description = "Default Editor";
    default = null;
  };

  imports = [
    ./neovim
    ./kakoune.nix
  ];

  config = lib.mkMerge [
    (lib.mkIf (cfg.default == "kakoune") {
      software.editor.kakoune.enable = true;
      home.sessionVariables = rec {
        EDITOR = "kak";
        VISUAL = EDITOR;
      };
    })
    (lib.mkIf (cfg.default == "neovim") {
      software.editor.neovim.enable = true;
      home.sessionVariables = rec {
        EDITOR = "nvim";
        VISUAL = EDITOR;
      };
    })
  ];
}
