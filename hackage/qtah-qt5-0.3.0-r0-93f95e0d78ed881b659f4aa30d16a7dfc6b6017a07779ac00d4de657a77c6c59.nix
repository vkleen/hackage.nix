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
      identifier = { name = "qtah-qt5"; version = "0.3.0"; };
      license = "LGPL-3.0-only";
      copyright = "Copyright 2015-2017 The Qtah Authors.";
      maintainer = "Bryan Gardiner <bog@khumba.net>";
      author = "Bryan Gardiner <bog@khumba.net>";
      homepage = "http://khumba.net/projects/qtah";
      url = "";
      synopsis = "Qt bindings for Haskell";
      description = "Qtah is a set of Qt bindings for Haskell.  This package contains the Haskell\nside of the bindings, and is what Qt programs should use directly.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."hoppy-runtime" or (buildDepError "hoppy-runtime"))
          (hsPkgs."qtah-cpp-qt5" or (buildDepError "qtah-cpp-qt5"))
          (hsPkgs."qtah-generator" or (buildDepError "qtah-generator"))
          ];
        libs = [ (pkgs."qtah" or (sysDepError "qtah")) ];
        buildable = true;
        };
      tests = {
        "test-qtah" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hoppy-runtime" or (buildDepError "hoppy-runtime"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."qtah-qt5" or (buildDepError "qtah-qt5"))
            ];
          libs = [ (pkgs."qtah" or (sysDepError "qtah")) ];
          buildable = true;
          };
        };
      };
    }