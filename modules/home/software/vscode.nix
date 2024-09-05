{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.software.vscode;
in {
  options.software.vscode = {
    enable =
      lib.mkEnableOption "VSCode configuration"
      // {
        default = config.desktop.enable;
        defaultText = lib.literalExpression "config.desktop.enable";
      };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
