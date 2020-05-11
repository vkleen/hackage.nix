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
      identifier = { name = "data-diverse-lens"; version = "3.0.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Louis Pan";
      maintainer = "louis@pan.me";
      author = "Louis Pan";
      homepage = "https://github.com/louispan/data-diverse-lens#readme";
      url = "";
      synopsis = "Isos & Lens for Data.Diverse.Many and Prisms for Data.Diverse.Which";
      description = "Isos & Lens for Data.Diverse.Many and Prisms for Data.Diverse.Which\nRefer to [ManySpec.hs](https://github.com/louispan/data-diverse-lens/blob/master/test/Data/Diverse/Lens/ManySpec.hs) and [WhichSpec.hs](https://github.com/louispan/data-diverse-lens/blob/master/test/Data/Diverse/Lens/WhichSpec.hs) for example usages.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-diverse" or (buildDepError "data-diverse"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
          (hsPkgs."lens" or (buildDepError "lens"))
          ];
        buildable = true;
        };
      tests = {
        "data-diverse-lens-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-diverse" or (buildDepError "data-diverse"))
            (hsPkgs."data-diverse-lens" or (buildDepError "data-diverse-lens"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
            ];
          buildable = true;
          };
        };
      };
    }