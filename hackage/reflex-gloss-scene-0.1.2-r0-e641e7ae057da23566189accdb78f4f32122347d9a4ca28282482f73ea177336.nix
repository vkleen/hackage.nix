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
      identifier = { name = "reflex-gloss-scene"; version = "0.1.2"; };
      license = "BSD-3-Clause";
      copyright = "2015 Oliver Batchelor";
      maintainer = "saulzar@gmail.com";
      author = "Oliver Batchelor";
      homepage = "https://github.com/saulzar/reflex-gloss-scene";
      url = "";
      synopsis = "A simple scene-graph using reflex and gloss";
      description = "A scenegraph library using gloss and gloss-reflex, with support for picking,\ncontinuous time animations and monad based switching. An example of a framework\ncreated using the reflex-transformers package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."gloss" or (buildDepError "gloss"))
          (hsPkgs."gloss-rendering" or (buildDepError "gloss-rendering"))
          (hsPkgs."reflex-gloss" or (buildDepError "reflex-gloss"))
          (hsPkgs."reflex" or (buildDepError "reflex"))
          (hsPkgs."reflex-transformers" or (buildDepError "reflex-transformers"))
          (hsPkgs."reflex-animation" or (buildDepError "reflex-animation"))
          (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gloss" or (buildDepError "gloss"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-transformers" or (buildDepError "reflex-transformers"))
            (hsPkgs."reflex-gloss-scene" or (buildDepError "reflex-gloss-scene"))
            (hsPkgs."reflex-animation" or (buildDepError "reflex-animation"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "collections" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gloss" or (buildDepError "gloss"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-transformers" or (buildDepError "reflex-transformers"))
            (hsPkgs."reflex-gloss-scene" or (buildDepError "reflex-gloss-scene"))
            (hsPkgs."reflex-animation" or (buildDepError "reflex-animation"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "frpzoo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gloss" or (buildDepError "gloss"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-transformers" or (buildDepError "reflex-transformers"))
            (hsPkgs."reflex-animation" or (buildDepError "reflex-animation"))
            (hsPkgs."reflex-gloss-scene" or (buildDepError "reflex-gloss-scene"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "counter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gloss" or (buildDepError "gloss"))
            (hsPkgs."reflex" or (buildDepError "reflex"))
            (hsPkgs."reflex-transformers" or (buildDepError "reflex-transformers"))
            (hsPkgs."reflex-animation" or (buildDepError "reflex-animation"))
            (hsPkgs."reflex-gloss-scene" or (buildDepError "reflex-gloss-scene"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }