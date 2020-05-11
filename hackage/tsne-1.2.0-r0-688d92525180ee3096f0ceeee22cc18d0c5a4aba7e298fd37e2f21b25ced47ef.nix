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
      identifier = { name = "tsne"; version = "1.2.0"; };
      license = "LicenseRef-LGPL";
      copyright = "2017 Rob Agar";
      maintainer = "robagar@fastmail.net";
      author = "Rob Agar";
      homepage = "https://bitbucket.org/robagar/haskell-tsne";
      url = "";
      synopsis = "t-SNE";
      description = "Pure Haskell implementation of the t-SNE dimension reduction algorithm.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."normaldistribution" or (buildDepError "normaldistribution"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          ];
        buildable = true;
        };
      exes = {
        "haskell_tsne_example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."pipes" or (buildDepError "pipes"))
            (hsPkgs."tsne" or (buildDepError "tsne"))
            ];
          buildable = true;
          };
        "haskell_tsne_timing" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."pipes" or (buildDepError "pipes"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."tsne" or (buildDepError "tsne"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tSNE-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."tsne" or (buildDepError "tsne"))
            ];
          buildable = true;
          };
        };
      };
    }