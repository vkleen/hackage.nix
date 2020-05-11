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
    flags = { use-hmpfr = false; };
    package = {
      specVersion = "1.2";
      identifier = { name = "AERN-Real"; version = "0.10.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2007-2009 Michal Konecny, Amin Farjudian, Jan Duracz";
      maintainer = "mikkonecny@gmail.com";
      author = "Michal Konecny (Aston University)";
      homepage = "http://www-users.aston.ac.uk/~konecnym/DISCERN";
      url = "";
      synopsis = "arbitrary precision interval arithmetic for approximating exact real numbers";
      description = "Datatypes and abstractions for approximating exact real numbers\nand a basic arithmetic over such approximations.\nThe main datatype is interval with arbitrary precision endpoints\nsupported by safely rounding field and elementary operations\nwhose precision can be increased arbitrarily, so that they\nall converge to the exact operations.\n\nThe design of the library is inspired to some degree\nby Mueller's iRRAM and Lambov's RealLib\n(both are C++ libraries for exact real arithmetic).\n\nFor an architectural overview, see module \"Data.Number.ER.Real\".\n\nSimple examples of usage can be found in folder @examples@.\n\nThere is a built-in test suite and it can be evoked using\nthe module in the folder @tests@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.use-hmpfr
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."html" or (buildDepError "html"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hmpfr" or (buildDepError "hmpfr"))
            ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."html" or (buildDepError "html"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
        buildable = true;
        };
      };
    }