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
      specVersion = "1.2";
      identifier = { name = "AERN-RnToRm"; version = "0.5"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2007-2009 Michal Konecny, Jan Duracz";
      maintainer = "mikkonecny@gmail.com";
      author = "Michal Konecny (Aston University)";
      homepage = "http://www-users.aston.ac.uk/~konecnym/DISCERN";
      url = "";
      synopsis = "polynomial function enclosures (PFEs) approximating exact real functions";
      description = "AERN-RnToRm provides\ndatatypes and abstractions for approximating functions\nof type @D -> R^m@ where @D@ is a bounded interval in @R^n@\nwith non-empty interior.\n\nThe main datatype are function enclosures whose boundaries are\npiece-wise polynomial with a bounded degree.  (This degree can\nbe set arbitrarily high or as low as 0.)\nThis datatype is supported by safely rounding operations\nwhose precision can be increased arbitrarily, so that they\nall converge to the exact operations.\nField operations, integration, maximisation and some elementary operations\n(namely exp, sin, cos) are among those already implemented.\n\nFor an architectural overview, see module \"Data.Number.ER.RnToRm\".\n\nA mathematical description of the very basics as well as a brief comparison\nwith Taylor Models is included in the\npaper <http://www-users.aston.ac.uk/~konecnym/papers/cfv08.html>.\n\nSimple examples of usage can be found in folder @demos@\nand a test suite can be run via the module in the folder @tests@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."AERN-Real" or (buildDepError "AERN-Real"))
          (hsPkgs."AERN-Real" or (buildDepError "AERN-Real"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."html" or (buildDepError "html"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          ];
        buildable = true;
        };
      };
    }