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
      identifier = { name = "Parallel-Arrows-Eden"; version = "0.1.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Martin Braun";
      author = "";
      homepage = "https://github.com/s4ke/Parrows#readme";
      url = "";
      synopsis = "Eden based backend for @Parallel-Arrows-Definition@.";
      description = "Eden based backend for @Parallel-Arrows-Definition@.\nThis backend works on shared-memory (compile with -parcp) systems or on clusters (only -parmpi was tested).\nFor parallel evaluation on clusters you will have to compile your own Eden GHC (http://www.mathematik.uni-marburg.de/~eden/).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."edenmodules" or (buildDepError "edenmodules"))
          (hsPkgs."Parallel-Arrows-Definition" or (buildDepError "Parallel-Arrows-Definition"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."edenmodules" or (buildDepError "edenmodules"))
            (hsPkgs."Parallel-Arrows-Definition" or (buildDepError "Parallel-Arrows-Definition"))
            (hsPkgs."Parallel-Arrows-BaseSpec" or (buildDepError "Parallel-Arrows-BaseSpec"))
            (hsPkgs."Parallel-Arrows-Eden" or (buildDepError "Parallel-Arrows-Eden"))
            ];
          buildable = true;
          };
        };
      };
    }