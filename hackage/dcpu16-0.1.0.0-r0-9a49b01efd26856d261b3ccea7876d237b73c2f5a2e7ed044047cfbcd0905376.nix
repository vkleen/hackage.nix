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
      identifier = { name = "dcpu16"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016 Anatoly Krivolapov";
      maintainer = "example@example.com";
      author = "Anatoly Krivolapov";
      homepage = "https://github.com/githubuser/dcpu16#readme";
      url = "";
      synopsis = "Initial project template from stack";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."sdl2" or (buildDepError "sdl2"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."spool" or (buildDepError "spool"))
          ];
        buildable = true;
        };
      exes = {
        "dcpu16-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dcpu16" or (buildDepError "dcpu16"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      tests = {
        "dcpu16-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dcpu16" or (buildDepError "dcpu16"))
            ];
          buildable = true;
          };
        };
      };
    }