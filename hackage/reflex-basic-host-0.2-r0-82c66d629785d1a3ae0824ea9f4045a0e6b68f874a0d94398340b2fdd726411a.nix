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
      identifier = { name = "reflex-basic-host"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2019, Commonwealth Scientific and Industrial Research Organisation (CSIRO) ABN 41 687 119 230.";
      maintainer = "dave.laing.80@gmail.com, jack.kelly@data61.csiro.au";
      author = "Dave Laing";
      homepage = "https://github.com/qfpl/reflex-basic-host/";
      url = "";
      synopsis = "A basic `reflex` host for backend work";
      description = "<<https://raw.githubusercontent.com/qfpl/assets/master/data61-transparent-bg.png>>\n\nreflex-basic-host provides a basic Reflex host for backend work. It\nprovides instances for most of the important Reflex typeclasses.\n\n@Reflex.Host.Basic.basicHostWithQuit@ is the main entry point for\nrunning FRP code. Use the @TriggerEvent@ instance to construct\n@Event@s and control when they fire firings, and use the\n@PerformEvent@ instance to take actions in response to @Event@\nfirings.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
          (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."ref-tf" or (buildDepError "ref-tf"))
          (hsPkgs."reflex" or (buildDepError "reflex"))
          (hsPkgs."stm" or (buildDepError "stm"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-basic-host" or (buildDepError "reflex-basic-host"))
            ];
          buildable = true;
          };
        "counter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-basic-host" or (buildDepError "reflex-basic-host"))
            ];
          buildable = true;
          };
        "multithread" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."ref-tf" or (buildDepError "ref-tf"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-basic-host" or (buildDepError "reflex-basic-host"))
            (hsPkgs."witherable" or (buildDepError "witherable"))
            ];
          buildable = true;
          };
        };
      };
    }