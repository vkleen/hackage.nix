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
      identifier = { name = "xcffib"; version = "0.2.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "Tycho Andersen <tycho@tycho.ws>";
      author = "Tycho Andersen";
      homepage = "http://github.com/tych0/xcffib";
      url = "";
      synopsis = "A cffi-based python binding for X";
      description = "A cffi-based python binding for X, comparable to xpyb";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."xcb-types" or (buildDepError "xcb-types"))
          (hsPkgs."language-python" or (buildDepError "language-python"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."filemanip" or (buildDepError "filemanip"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        buildable = true;
        };
      exes = {
        "xcffibgen" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xcffib" or (buildDepError "xcffib"))
            (hsPkgs."language-python" or (buildDepError "language-python"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."xcb-types" or (buildDepError "xcb-types"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."filemanip" or (buildDepError "filemanip"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      tests = {
        "PyHelpersTests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xcffib" or (buildDepError "xcffib"))
            (hsPkgs."language-python" or (buildDepError "language-python"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            ];
          buildable = true;
          };
        "GeneratorTests.hs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xcffib" or (buildDepError "xcffib"))
            (hsPkgs."xcb-types" or (buildDepError "xcb-types"))
            (hsPkgs."language-python" or (buildDepError "language-python"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      };
    }