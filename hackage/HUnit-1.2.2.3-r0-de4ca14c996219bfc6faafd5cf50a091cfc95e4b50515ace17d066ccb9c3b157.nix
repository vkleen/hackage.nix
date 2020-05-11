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
    flags = { base4 = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "HUnit"; version = "1.2.2.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "hunit@richardg.name";
      author = "Dean Herington";
      homepage = "http://hunit.sourceforge.net/";
      url = "";
      synopsis = "A unit testing framework for Haskell";
      description = "HUnit is a unit testing framework for Haskell, inspired by the\nJUnit tool for Java, see: <http://www.junit.org>.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = ([ (hsPkgs."base" or (buildDepError "base")) ] ++ [
          (hsPkgs."base" or (buildDepError "base"))
          ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."base" or (buildDepError "base"));
        buildable = true;
        };
      exes = {
        "basic-tests" = {
          depends = ([ (hsPkgs."base" or (buildDepError "base")) ] ++ [
            (hsPkgs."base" or (buildDepError "base"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."base" or (buildDepError "base"));
          buildable = true;
          };
        "extended-tests" = {
          depends = ([ (hsPkgs."base" or (buildDepError "base")) ] ++ [
            (hsPkgs."base" or (buildDepError "base"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."base" or (buildDepError "base"));
          buildable = true;
          };
        "terminal-tests" = {
          depends = ([ (hsPkgs."base" or (buildDepError "base")) ] ++ [
            (hsPkgs."base" or (buildDepError "base"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."base" or (buildDepError "base"));
          buildable = true;
          };
        };
      };
    }