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
      identifier = { name = "ViennaRNAParser"; version = "1.2.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "florian.eggenhofer@univie.ac.at";
      author = "Florian Eggenhofer";
      homepage = "";
      url = "";
      synopsis = "Libary for parsing ViennaRNA package output";
      description = "Currently contains parsers and datatypes for: RNAalifold, RNAdistance, RNAcofold, RNAfold, RNAplex, RNAup, RNAz.\n\nFor more information on the ViennaRNA package refer to <http://www.tbi.univie.ac.at/RNA/>.\n\nThe libary is tested with Version 2.1.9 of the ViennaRNA package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."process" or (buildDepError "process"))
          ];
        buildable = true;
        };
      tests = {
        "hspec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."ViennaRNAParser" or (buildDepError "ViennaRNAParser"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }