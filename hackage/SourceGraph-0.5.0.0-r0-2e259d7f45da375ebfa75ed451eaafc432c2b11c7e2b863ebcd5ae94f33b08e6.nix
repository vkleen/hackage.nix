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
      identifier = { name = "SourceGraph"; version = "0.5.0.0"; };
      license = "LicenseRef-GPL";
      copyright = "(c) Ivan Lazar Miljenovic";
      maintainer = "Ivan.Miljenovic@gmail.com";
      author = "Ivan Lazar Miljenovic";
      homepage = "";
      url = "";
      synopsis = "Use graph-theory to analyse your code";
      description = "SourceGraph uses the Graphalyze library to analyse\nCabalized Haskell code.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "SourceGraph" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."multiset" or (buildDepError "multiset"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."Graphalyze" or (buildDepError "Graphalyze"))
            (hsPkgs."graphviz" or (buildDepError "graphviz"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            ];
          buildable = true;
          };
        };
      };
    }