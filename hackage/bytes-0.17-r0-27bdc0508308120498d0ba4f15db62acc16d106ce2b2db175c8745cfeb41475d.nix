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
    flags = { test-doctests = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "bytes"; version = "0.17"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2013-2015 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "https://github.com/ekmett/bytes";
      url = "";
      synopsis = "Sharing code for serialization between binary and cereal";
      description = "Sharing code for serialization between binary and cereal.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (buildToolDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (buildToolDepError "Cabal")))
        (hsPkgs.buildPackages.cabal-doctest or (pkgs.buildPackages.cabal-doctest or (buildToolDepError "cabal-doctest")))
        ];
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."binary-orphans" or (buildDepError "binary-orphans"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."void" or (buildDepError "void"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && ((compiler.version).ge "7.4" && (compiler.version).lt "7.6")) (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))) ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."fail" or (buildDepError "fail"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.test-doctests)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytes" or (buildDepError "bytes"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = if !flags.test-doctests then false else true;
          };
        };
      };
    }