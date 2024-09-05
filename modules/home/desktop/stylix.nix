{
  config,
  inputs,
  osConfig,
  lib,
  ...
}: let
  enable = osConfig.programs.stylix.enable or false;
  homeModule = osConfig.traits.users.aurel.enable or false;
in {
  imports =
    if homeModule
    then []
    else [inputs.stylix.homeManagerModules.stylix];

  config = lib.mkIf enable {
    stylix = {
      enable = true;
      polarity = "dark";
      image = inputs.self + "/wallpaper.png";
      base16Scheme = inputs.self + "/theme.yaml";
      autoEnable = true;
    };
  };
}
