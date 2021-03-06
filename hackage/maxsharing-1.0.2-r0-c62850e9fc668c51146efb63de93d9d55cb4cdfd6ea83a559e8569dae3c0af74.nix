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
      specVersion = "1.6";
      identifier = { name = "maxsharing"; version = "1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013, Jan Rochel";
      maintainer = "jan@rochel.info";
      author = "Jan Rochel";
      homepage = "http://rochel.info/maxsharing/";
      url = "";
      synopsis = "Maximal sharing of terms in the lambda calculus with letrec";
      description = "Parses a lambda-letrec term; transforms it into a first-order\nterm graph representation; minimises the graph; reads back a\nlambda-letrec term which has the same unfolding as the original\nterm, but exhibits maximal sharing.\nIf executable \"dot\" from graphviz is available, the graphs are\ndisplayed (tested for Linux).\nThe approach is described in a technical report:\nhttp://arxiv.org/abs/1401.1460";
      buildType = "Custom";
      };
    components = {
      exes = {
        "maxsharing" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-unicode-symbols" or (buildDepError "base-unicode-symbols"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."IndentParser" or (buildDepError "IndentParser"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."containers-unicode-symbols" or (buildDepError "containers-unicode-symbols"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."uuagc-cabal" or (buildDepError "uuagc-cabal"))
            (hsPkgs."uuagc" or (buildDepError "uuagc"))
            (hsPkgs."HaLeX" or (buildDepError "HaLeX"))
            (hsPkgs."boxes" or (buildDepError "boxes"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }