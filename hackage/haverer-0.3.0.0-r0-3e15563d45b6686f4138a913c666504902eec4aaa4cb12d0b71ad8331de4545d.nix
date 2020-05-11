let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "haverer"; version = "0.3.0.0"; };
      license = "Apache-2.0";
      copyright = "Jonathan M. Lange";
      maintainer = "jml@mumak.net";
      author = "Jonathan M. Lange <jml@mumak.net>";
      homepage = "";
      url = "";
      synopsis = "Implementation of the rules of Love Letter";
      description = "Implementation of the rules of Love Letter";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."tasty" or (buildDepError "tasty"))
          (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
          (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      exes = {
        "haverer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haverer" or (buildDepError "haverer"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."haverer" or (buildDepError "haverer"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."errors" or (buildDepError "errors"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }