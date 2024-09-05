{
  lib,
  osConfig,
  inputs,
  ...
}: let
  enable = osConfig.programs.niri.enable or false;
  homeModule = osConfig.traits.users.aurel.enable or false;
in {
  imports =
    [
      ./settings.nix
    ]
    ++ (
      if homeModule
      then []
      else [inputs.niri.homeModules.niri]
    );

  config = lib.mkIf enable {
    desktop.gtk.enable = true;
  };
}
