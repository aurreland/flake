{pkgs, ...}: {
  imports = [
    ./boot.nix
    # ./disko.nix
    ./hardware-configuration.nix
  ];

  archetypes.personal.enable = true;

  desktop = {
    enable = true;
    gnome.enable = true;
  };

  base.nixSettings = {
    enable = true;
    lix.enable = true;
  };

  environment.systemPackages = [pkgs.neovim];

  users.users.aurel.initialPassword = "test";
  networking.hostName = "demeter";

  services = {
    flatpak.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
  };

  system.stateVersion = "23.11";

  traits = {
    users.aurel = {
      enable = true;
      #manageSecrets = false;
    };
    secrets.enable = true;
    containers.enable = true;
    zram.enable = true;
  };

  home-manager.users.aurel.aurel = {
    shell.fish.enable = true;
    programs = {
      starship.enable = true;
      chromium.enable = true;
      ssh.enable = true;
    };
  };
}
