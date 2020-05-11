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
      identifier = { name = "bv-sized"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Galois Inc., Ben Selfridge March 2018";
      maintainer = "benselfridge@galois.com";
      author = "Ben Selfridge";
      homepage = "https://github.com/GaloisInc/bv-sized";
      url = "";
      synopsis = "a bitvector datatype that is parameterized by the vector width";
      description = "This module defines a width-parameterized bitvector type and various associated\noperations.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bitwise" or (buildDepError "bitwise"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."panic" or (buildDepError "panic"))
          (hsPkgs."parameterized-utils" or (buildDepError "parameterized-utils"))
          (hsPkgs."th-lift" or (buildDepError "th-lift"))
          ];
        buildable = true;
        };
      tests = {
        "bv-sized-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bv-sized" or (buildDepError "bv-sized"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."parameterized-utils" or (buildDepError "parameterized-utils"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            ];
          buildable = true;
          };
        };
      };
    }