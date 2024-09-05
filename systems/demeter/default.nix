{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
  ];

  archetypes.personal.enable = true;

  desktop = {
    enable = true;
    gnome.enable = true;
    niri.enable = true;
    stylix.enable = true;
  };

  base = {
    nixSettings = {
      enable = true;
      lix.enable = true;
    };
  };

  environment.systemPackages = [pkgs.neovim pkgs.home-manager];

  users.users.aurel.initialPassword = "test";
  networking.hostName = "demeter";

  services = {
    flatpak.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
  };

  traits = {
    users.aurel = {
      enable = true;
      # manageSecrets = false;
    };
    home-manager.enable = true;
    secrets.enable = true;
    containers.enable = true;
    zram.enable = true;
  };

    programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  system.stateVersion = "23.11";
}
