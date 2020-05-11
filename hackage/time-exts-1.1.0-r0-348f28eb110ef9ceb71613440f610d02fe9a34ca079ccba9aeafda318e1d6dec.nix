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
      specVersion = "1.16.0";
      identifier = { name = "time-exts"; version = "1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2014, Enzo Haussecker. All rights reserved.";
      maintainer = "Enzo Haussecker <ehaussecker@gmail.com>";
      author = "Enzo Haussecker <ehaussecker@gmail.com>";
      homepage = "https://github.com/enzoh/time-exts";
      url = "";
      synopsis = "Efficient Timestamps";
      description = "Extensions to the Haskell time library, providing efficient Unix, UTC, and local timestamps.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."convertible" or (buildDepError "convertible"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."fclabels" or (buildDepError "fclabels"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."timezone-olson" or (buildDepError "timezone-olson"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.hsc2hs or (pkgs.buildPackages.hsc2hs or (buildToolDepError "hsc2hs")))
          ];
        buildable = true;
        };
      exes = {
        "test-time-exts" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."convertible" or (buildDepError "convertible"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."fclabels" or (buildDepError "fclabels"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."timezone-olson" or (buildDepError "timezone-olson"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hsc2hs or (pkgs.buildPackages.hsc2hs or (buildToolDepError "hsc2hs")))
            ];
          buildable = true;
          };
        };
      };
    }