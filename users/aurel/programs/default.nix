{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.aurel.programs;
in {
  options.aurel.programs = {
    basePrograms.enable =
      lib.mkEnableOption "base programs and configurations"
      // {
        default = config.aurel.enable;
      };
  };

  imports = with inputs; [
    ./starship
    ./chromium.nix
    ./gpg.nix
    ./mangohud.nix
    ./ssh.nix
    ./vscode.nix
  ];

  config = lib.mkIf cfg.basePrograms.enable {
    home.packages = with pkgs; [
      fd
      nix-output-monitor
      nurl
      rclone
      restic
    ];

    programs = {
      bat.enable = true;
      btop.enable = true;

      eza = {
        enable = true;
        icons = true;
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      ripgrep.enable = true;
    };

    xdg.enable = true;
  };
}
