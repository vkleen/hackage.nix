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
      specVersion = "1.12";
      identifier = { name = "nonempty-containers"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Justin Le 2018";
      maintainer = "justin@jle.im";
      author = "Justin Le";
      homepage = "https://github.com/mstksg/nonempty-containers#readme";
      url = "";
      synopsis = "Non-empty variants of containers data types, with full API";
      description = "Efficient and optimized non-empty versions of types from /containers/.\nInspired by /non-empty-containers/ library, except attempting a more\nfaithful port (with under-the-hood optimizations) of the full /containers/\nAPI. Also contains a convenient typeclass abstraction for converting\nbetwewen non-empty and possibly-empty variants. See README.md for more\ninformation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-or" or (buildDepError "data-or"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          ];
        buildable = true;
        };
      tests = {
        "nonempty-containers-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."comonad" or (buildDepError "comonad"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-or" or (buildDepError "data-or"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (buildDepError "hedgehog-fn"))
            (hsPkgs."nonempty-containers" or (buildDepError "nonempty-containers"))
            (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }