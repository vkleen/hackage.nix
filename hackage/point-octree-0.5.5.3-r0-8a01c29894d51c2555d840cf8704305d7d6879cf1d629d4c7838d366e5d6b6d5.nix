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
      identifier = { name = "point-octree"; version = "0.5.5.3"; };
      license = "BSD-3-Clause";
      copyright = "Copyright by Michal J. Gajda '2012, Copyright by Michael Litchard '2016";
      maintainer = "michael@schmong.org";
      author = "Michal J. Gajda, Michael Litchard";
      homepage = "https://github.com/mlitchard/point-octree";
      url = "http://hackage.haskell.org/package/point-octree";
      synopsis = "Point octree, with bounding boxes";
      description = "Based on Michal J. Gajda's octree package, but with bounding boxes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      tests = {
        "test_Octree" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "readme" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."markdown-unlit" or (buildDepError "markdown-unlit"))
            ];
          buildable = true;
          };
        "readme-BB" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."markdown-unlit" or (buildDepError "markdown-unlit"))
            ];
          buildable = true;
          };
        };
      };
    }