{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.software.basePrograms;
in {
  options.software.basePrograms = {
    enable =
      lib.mkEnableOption "base programs and configurations";
  };
  imports = with inputs; [
    ./editor
    ./starship
    ./terminal

    ./chromium.nix
    ./gamedev.nix
    ./games.nix
    ./gpg.nix
    ./mangohud.nix
    ./ssh.nix
    ./vscode.nix
  ];

  config = lib.mkIf cfg.enable {
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
