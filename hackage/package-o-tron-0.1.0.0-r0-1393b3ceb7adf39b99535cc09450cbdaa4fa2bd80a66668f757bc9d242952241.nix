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
      identifier = { name = "package-o-tron"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Jake Wheat 2012";
      maintainer = "jakewheatmail@gmail.com";
      author = "Jake Wheat";
      homepage = "";
      url = "";
      synopsis = "Utilities for working with cabal packages and your package database";
      description = "Utility to help managing Makefiles for Haskell projects, a cabal lint\nwhich can check the other-modules and build-deps\nsections in your cabal files, and a quick command\nthat can show the direct package dependencies of\na set of Haskell source files. See the README in\nthe repo for more information:\n<https://github.com/JakeWheat/package-o-tron>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."groom" or (buildDepError "groom"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."filemanip" or (buildDepError "filemanip"))
          ];
        buildable = true;
        };
      exes = {
        "Makefilerize" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."groom" or (buildDepError "groom"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filemanip" or (buildDepError "filemanip"))
            ];
          buildable = true;
          };
        "CabalLint" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."groom" or (buildDepError "groom"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filemanip" or (buildDepError "filemanip"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."packdeps" or (buildDepError "packdeps"))
            ];
          buildable = true;
          };
        "ShowPackages" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."groom" or (buildDepError "groom"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filemanip" or (buildDepError "filemanip"))
            ];
          buildable = true;
          };
        };
      };
    }