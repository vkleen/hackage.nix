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
      identifier = { name = "halma-gui"; version = "0.1.1.0"; };
      license = "MIT";
      copyright = "2015-2017 Tim Baumann";
      maintainer = "tim@timbaumann.info";
      author = "Tim Baumann";
      homepage = "https://github.com/timjb/halma";
      url = "";
      synopsis = "GTK application for playing Halma";
      description = "Play Halma (aka Chinese Checkers) on your desktop against your friends or an AI";
      buildType = "Simple";
      };
    components = {
      exes = {
        "halma-gui" = {
          depends = [
            (hsPkgs."halma" or (buildDepError "halma"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."diagrams-gtk" or (buildDepError "diagrams-gtk"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
            (hsPkgs."pipes" or (buildDepError "pipes"))
            (hsPkgs."mvc" or (buildDepError "mvc"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."timeit" or (buildDepError "timeit"))
            ];
          buildable = true;
          };
        };
      };
    }