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
      identifier = { name = "apart"; version = "0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2018 Murat Kasimov";
      maintainer = "Murat Kasimov <iokasimov.m@gmail.com>";
      author = "Murat Kasimov";
      homepage = "https://github.com/iokasimov/tree";
      url = "";
      synopsis = "Get all your structure and rip it apart.";
      description = "The main idea: if you can describe your data structure via Cofree, with apart you can serialize, persistent or hash a segment of your structure!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."comonad" or (buildDepError "comonad"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."contravariant" or (buildDepError "contravariant"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
            (hsPkgs."apart" or (buildDepError "apart"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."comonad" or (buildDepError "comonad"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."contravariant" or (buildDepError "contravariant"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
            (hsPkgs."apart" or (buildDepError "apart"))
            ];
          buildable = true;
          };
        };
      };
    }