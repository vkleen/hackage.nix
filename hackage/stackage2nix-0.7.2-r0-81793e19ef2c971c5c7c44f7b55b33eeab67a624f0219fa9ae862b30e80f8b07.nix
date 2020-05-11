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
      identifier = { name = "stackage2nix"; version = "0.7.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "bushevdv@gmail.com";
      author = "Dmitry Bushev\n, Benno Fünfstück";
      homepage = "https://github.com/typeable/stackage2nix#readme";
      url = "";
      synopsis = "Convert Stack files into Nix build instructions.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cabal2nix" or (buildDepError "cabal2nix"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."distribution-nixpkgs" or (buildDepError "distribution-nixpkgs"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."gitlib" or (buildDepError "gitlib"))
          (hsPkgs."gitlib-libgit2" or (buildDepError "gitlib-libgit2"))
          (hsPkgs."hopenssl" or (buildDepError "hopenssl"))
          (hsPkgs."inflections" or (buildDepError "inflections"))
          (hsPkgs."language-nix" or (buildDepError "language-nix"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."stackage-curator" or (buildDepError "stackage-curator"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "stackage2nix" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."stackage2nix" or (buildDepError "stackage2nix"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."stackage2nix" or (buildDepError "stackage2nix"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        };
      };
    }