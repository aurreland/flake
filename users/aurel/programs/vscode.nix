{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.aurel.programs.vscode;
in {
  options.aurel.programs.vscode = {
    enable =
      lib.mkEnableOption "VSCode configuration"
      // {
        default = config.aurel.desktop.enable;
        defaultText = lib.literalExpression "config.aurel.desktop.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
