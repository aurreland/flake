{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.desktop.cosmic;
in {
  options.desktop.cosmic.enable = lib.mkEnableOption "COSMIC desktop";

  imports = [inputs.nixos-cosmic.nixosModules.default];

  config = lib.mkIf cfg.enable {
    nix.settings = {
      substituters = ["https://cosmic.cachix.org/"];
      trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
    };

    services = {
      desktopManager.cosmic = {
        enable = true;
        xwayland.enable = true;
      };
      displayManager.cosmic-greeter.enable = true;
    };

    environment.systemPackages = with pkgs; [adw-gtk3];
  };
}
