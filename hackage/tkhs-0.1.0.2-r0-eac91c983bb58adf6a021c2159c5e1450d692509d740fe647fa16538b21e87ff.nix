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
    flags = { test = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "tkhs"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yusaku Hashimoto <nonowarn@gmail.com>";
      author = "Yusaku Hashimoto";
      homepage = "http://patch-tag.com/r/tkhs/snapshot/current/content/pretty/README";
      url = "";
      synopsis = "Simple Presentation Utility";
      description = "If you want to give your presentation in a terminal,\nor if PowerPoint would be overkill, you may find tkhs useful.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "tkhs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pointedlist" or (buildDepError "pointedlist"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."vty" or (buildDepError "vty"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = if flags.test then false else true;
          };
        "test" = {
          depends = [
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          buildable = if !flags.test then false else true;
          };
        };
      };
    }