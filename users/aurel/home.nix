{
  imports = [./.];

  aurel = {
    enable = true;
    standalone.enable = true;
    shell.fish.enable = true;
    programs = {
      starship.enable = true;
      chromium.enable = true;
      ssh.enable = true;
    };
  };
}
