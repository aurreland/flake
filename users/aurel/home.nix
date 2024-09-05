{inputs, ...}: {
  imports = [(inputs.self + "/modules/home")];

  base.aurel = {
    enable = true;
    standalone.enable = true;
  };

  shell.default = "fish";

  software = {
    starship.enable = true;
    chromium.enable = true;
    ssh.enable = false;
    terminal.default = "kitty";
    editor.default = "kakoune";
    gamedev.enable = true;
  };

  home.stateVersion = "23.11";
}
