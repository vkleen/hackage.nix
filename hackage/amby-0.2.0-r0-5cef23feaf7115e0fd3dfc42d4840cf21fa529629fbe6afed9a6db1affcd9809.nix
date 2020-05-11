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
      identifier = { name = "amby"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2014-2016 Justin Sermeno";
      maintainer = "Justin Sermeno";
      author = "Justin Sermeno";
      homepage = "https://github.com/githubuser/amby#readme";
      url = "";
      synopsis = "Statistical data visualization";
      description = "Statistical data visualization. Provides a high-level\ninterface built on top of\n<https://github.com/timbod7/haskell-chart/wiki Chart>\nto quickly display attractive visualizations within GHCi.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."Chart-cairo" or (buildDepError "Chart-cairo"))
          (hsPkgs."Chart-diagrams" or (buildDepError "Chart-diagrams"))
          (hsPkgs."Chart" or (buildDepError "Chart"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."statistics" or (buildDepError "statistics"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."pretty-display" or (buildDepError "pretty-display"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          ];
        buildable = true;
        };
      exes = {
        "amby-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."amby" or (buildDepError "amby"))
            ];
          buildable = true;
          };
        };
      tests = {
        "amby-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."amby" or (buildDepError "amby"))
            ];
          buildable = true;
          };
        };
      };
    }