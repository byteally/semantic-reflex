(import ./reflex-platform.nix {}).project ({ pkgs, hackGet, ... }: {
  packages = {
    semantic-reflex = ./semantic-reflex;
    semantic-reflex-example = ./semantic-reflex-example;
    reflex-dom-nested-routing = hackGet ./deps/reflex-dom-nested-routing;
    # reflex-dom-contrib = hackGet ./deps/reflex-dom-contrib;
    reflex-dom-contrib = self.callCabal2nix
      "reflex-dom-contrib"
      (pkgs.fetchFromGitHub {
        owner = "reflex-frp";
        repo = "reflex-dom-contrib";
        rev = "b9e2965dff062a4e13140f66d487362a34fe58b3";
        sha256 = "1aa045mr82hdzzd8qlqhfrycgyhd29lad8rf7vsqykly9axpl52a";
      }) {};
  };

  overrides = self: super: {

    # Haddock is broken in GHC 8.4's version:
    # https://github.com/haskell/haddock/issues/775
    semantic-reflex = pkgs.haskell.lib.dontHaddock super.semantic-reflex;

  };

  shells =
    let mkShell = c: { name = c; value = ["semantic-reflex" "semantic-reflex-example"]; };
    in builtins.listToAttrs (map mkShell [
      "ghc"
      "ghc8_6"

      "ghcjs"
      "ghcjs8_6"
    ]);
})
