{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.aurel.programs.ssh;
in
{
  options.aurel.programs.ssh = {
    enable = lib.mkEnableOption "SSH configuration" // {
      default = config.aurel.enable;
      defaultText = lib.literalExpression "config.aurel.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      package = pkgs.openssh;
    };

    services.ssh-agent.enable = pkgs.stdenv.isLinux;
  };
}
