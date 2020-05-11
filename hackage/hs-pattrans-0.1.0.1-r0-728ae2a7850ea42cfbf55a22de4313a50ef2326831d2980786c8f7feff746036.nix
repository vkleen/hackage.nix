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
      identifier = { name = "hs-pattrans"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Orestis Melkonian <melkon.or@gmail.com>";
      author = "Orestis Melkonian";
      homepage = "https://github.com/omelkonian/hs-pattrans";
      url = "";
      synopsis = "DSL for musical patterns and transformation, based on contravariant functors.";
      description = "A music DSL for defining pattern transformations, analyzing pattern datasets and detecting patterns.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."Chart" or (buildDepError "Chart"))
          (hsPkgs."Chart-cairo" or (buildDepError "Chart-cairo"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."Euterpea" or (buildDepError "Euterpea"))
          (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cassava" or (buildDepError "cassava"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."async" or (buildDepError "async"))
          ];
        buildable = true;
        };
      exes = {
        "hs-pattrans" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hs-pattrans" or (buildDepError "hs-pattrans"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hs-pattrans" or (buildDepError "hs-pattrans"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover or (buildToolDepError "hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }