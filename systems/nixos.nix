{self, ...}: {
  flake = {
    nixosConfigurations = let
      # see ./lib/builders.nix
      inherit (self.lib) nixosSystem;
    in {
      demeter = nixosSystem {modules = [./demeter];};
    };
  };
}
