{
  self,
  withSystem,
  ...
}: {
  flake.homeConfigurations = let
    inherit (self.lib) homeManagerConfiguration;

    pkgsFor = system: withSystem system ({pkgs, ...}: pkgs);
  in {
    aurel = homeManagerConfiguration {
      pkgs = pkgsFor "x86_64-linux";
      modules = [./aurel/home.nix];
    };
  };
}
