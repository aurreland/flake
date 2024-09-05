{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.software.ssh;
in {
  options.software.ssh = {
    enable = lib.mkEnableOption "SSH configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      package = pkgs.openssh;
    };

    services.ssh-agent.enable = pkgs.stdenv.isLinux;
  };
}
