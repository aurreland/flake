{
  config,
  lib,
  ...
}: let
  cfg = config.software.terminal.kitty;
in {
  options.software.terminal.kitty = {
    enable = lib.mkEnableOption "Kitty Terminal";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        shell = config.shell.default;
        confirm_os_window_close = 0;
        window_padding_width = 20;
      };
    };
  };
}
