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
    flags = { triples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "csg"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "dima@dzhus.org";
      author = "Dmitry Dzhus";
      homepage = "https://github.com/dzhus/csg#readme";
      url = "";
      synopsis = "Analytical CSG (Constructive Solid Geometry) library";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."simple-vec3" or (buildDepError "simple-vec3"))
          (hsPkgs."strict" or (buildDepError "strict"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      exes = {
        "csg-raycaster" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."csg" or (buildDepError "csg"))
            (hsPkgs."gloss" or (buildDepError "gloss"))
            (hsPkgs."gloss-raster" or (buildDepError "gloss-raster"))
            (hsPkgs."simple-vec3" or (buildDepError "simple-vec3"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."turtle" or (buildDepError "turtle"))
            ];
          buildable = true;
          };
        };
      tests = {
        "csg-doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."doctest-driver-gen" or (buildDepError "doctest-driver-gen"))
            (hsPkgs."simple-vec3" or (buildDepError "simple-vec3"))
            ];
          buildable = true;
          };
        "csg-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."csg" or (buildDepError "csg"))
            (hsPkgs."simple-vec3" or (buildDepError "simple-vec3"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "csg-benchmark" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."csg" or (buildDepError "csg"))
            (hsPkgs."simple-vec3" or (buildDepError "simple-vec3"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }