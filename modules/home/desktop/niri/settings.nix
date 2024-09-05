{lib, ...}: {
  programs.niri.settings = lib.mkMerge [
    {
      input = {
        keyboard = {
          xkb = {
            layout = "fr";
          };
        };
      };
      binds = {
        "Mod+T".action.spawn = "kitty";
      };
    }
  ];
}
