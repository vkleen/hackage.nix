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
      identifier = { name = "cabal-macosx"; version = "0.2.4.0"; };
      license = "BSD-3-Clause";
      copyright = "Eric Kow & Andy Gimblett";
      maintainer = "Daniele Francesconi <dfrancesconi12@gmail.com>";
      author = "Eric Kow <eric.kow@gmail.com> & Andy Gimblett <haskell@gimbo.org.uk>";
      homepage = "http://github.com/danfran/cabal-macosx";
      url = "";
      synopsis = "Cabal support for creating Mac OSX application bundles.";
      description = "GUI applications on Mac OSX must be run as application /bundles/;\nthese wrap an executable in a particular directory structure which\ncan also carry resources such as icons, program metadata, other\nbinaries, and copies of shared libraries.\nThis package provides Cabal support for creating such application\nbundles.\nFor more information about OSX application bundles, look for the\n/Bundle Programming Guide/ on the /Apple Developer Connection/\nwebsite, <http://developer.apple.com/>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."hscolour" or (buildDepError "hscolour"))
          (hsPkgs."fgl" or (buildDepError "fgl"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "macosx-app" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }