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
      identifier = { name = "Hoed"; version = "0.4.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2000 Andy Gill, (c) 2010 University of Kansas, (c) 2013-2018 Maarten Faddegon";
      maintainer = "hoed@maartenfaddegon.nl";
      author = "Maarten Faddegon";
      homepage = "https://github.com/MaartenFaddegon/Hoed";
      url = "";
      synopsis = "Lightweight algorithmic debugging.";
      description = "Hoed is a tracer and debugger for the programming language Haskell.\n\nTo locate a defect with Hoed you annotate suspected functions and compile as usual. Then you run your program, information about the annotated functions is collected. Finally you connect to a debugging session.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."libgraph" or (buildDepError "libgraph"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."strict" or (buildDepError "strict"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."terminal-size" or (buildDepError "terminal-size"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "test-queens" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            ];
          buildable = true;
          };
        "test-1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-3" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-4" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-5" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-6" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "test-7" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Hoed" or (buildDepError "Hoed"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }