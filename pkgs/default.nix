{
  perSystem = {pkgs, ...}: {
    packages = {
      material-maker = pkgs.callPackage ./material-maker.nix {};
    };
  };
}
