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
      specVersion = "0";
      identifier = { name = "lcs"; version = "0.2"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Ian Lynagh, 2005";
      maintainer = "igloo@earth.li";
      author = "Ian Lynagh";
      homepage = "http://urchin.earth.li/~ian/cabal/lcs/";
      url = "";
      synopsis = "Find longest common sublist of two lists";
      description = "Provides a function lcs that takes two lists and returns a longest\ncommon sublist. For example, lcs \"abcd\" \"acbd\" is either \"abd\" or\n\"acd\".\n\nThe package provides a simple, stupid and (most of all) slow\nimplementation that needs, for inputs of length m and n, O(m+n)\nspace and O((m+n)!) time in the worst case.\n\nIt also provides an implementation of the Hunt-Szymanski LCS\nalgorithm, based on that in \"String searching algorithms\" by\nGraham A Stephen, ISBN 981021829X.\n\nGiven inputs xs and ys of length m and n respectively, where there\nare r pairs (x, y) where x is in xs, y is in ys and x == y,\nHunt-Szymanski needs O(r+m+n) space and O((r+m+n)*log(m+n)) time.\nThus this is O((m+n)^2) space and O((m+n)^2*log(m+n)) time in the\nworst case.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      };
    }