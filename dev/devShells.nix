{
  perSystem = {
    lib,
    pkgs,
    inputs',
    self',
    ...
  }: {
    devShells = {
      default = pkgs.mkShellNoCC {
        packages =
          [
            pkgs.lix

            # format + lint
            pkgs.actionlint
            self'.formatter
            pkgs.deadnix
            pkgs.nil
            pkgs.statix

            # utils
            pkgs.fzf # for just
            pkgs.just
          ]
          ++ lib.optionals pkgs.stdenv.isLinux [
            (pkgs.nixos-rebuild.override {nix = pkgs.lix;}) # ditto
            inputs'.agenix.packages.agenix
          ];
      };
    };
  };
}
