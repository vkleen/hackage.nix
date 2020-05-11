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
      specVersion = "1.8";
      identifier = { name = "Dust-crypto"; version = "0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "brandon@ischool.utexas.edu";
      author = "Brandon Wiley";
      homepage = "";
      url = "";
      synopsis = "Cryptographic operations";
      description = "Cryptographic operations used by the Dust polymorphic protocl engine";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."entropy" or (buildDepError "entropy"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."random-extras" or (buildDepError "random-extras"))
          (hsPkgs."random-source" or (buildDepError "random-source"))
          (hsPkgs."random-fu" or (buildDepError "random-fu"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."skein" or (buildDepError "skein"))
          (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."threefish" or (buildDepError "threefish"))
          ];
        libs = (pkgs.lib).optional (system.isLinux || system.isOsx) (pkgs."crypto" or (sysDepError "crypto"));
        buildable = true;
        };
      tests = {
        "crypto" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Dust" or (buildDepError "Dust"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."threefish" or (buildDepError "threefish"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }