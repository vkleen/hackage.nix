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
      identifier = { name = "inline-c-cpp"; version = "0.4.0.2"; };
      license = "MIT";
      copyright = "(c) 2015-2016 FP Complete Corporation, (c) 2017-2019 Francesco Mazzoli";
      maintainer = "f@mazzo.li";
      author = "Francesco Mazzoli";
      homepage = "";
      url = "";
      synopsis = "Lets you embed C++ code into Haskell.";
      description = "Utilities to inline C++ code into Haskell using inline-c.  See\ntests for example on how to build.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."inline-c" or (buildDepError "inline-c"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        libs = [ (pkgs."stdc++" or (sysDepError "stdc++")) ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."inline-c" or (buildDepError "inline-c"))
            (hsPkgs."inline-c-cpp" or (buildDepError "inline-c-cpp"))
            (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          libs = [ (pkgs."stdc++" or (sysDepError "stdc++")) ];
          buildable = true;
          };
        };
      };
    }