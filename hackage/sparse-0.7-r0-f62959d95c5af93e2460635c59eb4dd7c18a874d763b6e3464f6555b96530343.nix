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
    flags = {
      test-properties = true;
      test-doctests = true;
      test-hlint = true;
      optimize = true;
      llvm = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "sparse"; version = "0.7"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2013 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/sparse";
      url = "";
      synopsis = "A playground of sparse linear algebra primitives using Morton ordering";
      description = "A playground of sparse linear algebra primitives using Morton ordering\n\nThe design of this library is describe in the following articles on FP Complete's School of Haskell.\n\n1. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-1>\n\n2. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-2>\n\n3. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-3>\n\n4. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-4>\n\n5. <https://www.fpcomplete.com/user/edwardk/revisiting-matrix-multiplication-part-5>";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hybrid-vectors" or (buildDepError "hybrid-vectors"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
          ];
        buildable = true;
        };
      tests = {
        "properties" = {
          depends = (pkgs.lib).optionals (!(!flags.test-properties)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hybrid-vectors" or (buildDepError "hybrid-vectors"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."sparse" or (buildDepError "sparse"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (buildDepError "test-framework-th"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = if !flags.test-properties then false else true;
          };
        "hlint" = {
          depends = (pkgs.lib).optionals (!(!flags.test-hlint)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hlint" or (buildDepError "hlint"))
            ];
          buildable = if !flags.test-hlint then false else true;
          };
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.test-doctests)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."simple-reflect" or (buildDepError "simple-reflect"))
            ];
          buildable = if !flags.test-doctests then false else true;
          };
        };
      benchmarks = {
        "mm" = {
          depends = [
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."sparse" or (buildDepError "sparse"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }