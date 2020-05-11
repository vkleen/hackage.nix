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
      specVersion = "1.12";
      identifier = { name = "box"; version = "0.3.0"; };
      license = "BSD-3-Clause";
      copyright = "Tony Day (c) 2017";
      maintainer = "tonyday567@gmail.com";
      author = "Tony Day";
      homepage = "https://github.com/tonyday567/box#readme";
      url = "";
      synopsis = "boxes";
      description = "concurrent, effectful boxes";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."concurrency" or (buildDepError "concurrency"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."foldl" or (buildDepError "foldl"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."streaming" or (buildDepError "streaming"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."typed-process" or (buildDepError "typed-process"))
          ];
        buildable = true;
        };
      exes = {
        "concurrency-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."box" or (buildDepError "box"))
            (hsPkgs."concurrency" or (buildDepError "concurrency"))
            (hsPkgs."dejafu" or (buildDepError "dejafu"))
            (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."streaming" or (buildDepError "streaming"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        "websocket-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."box" or (buildDepError "box"))
            (hsPkgs."concurrency" or (buildDepError "concurrency"))
            (hsPkgs."dejafu" or (buildDepError "dejafu"))
            (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."managed" or (buildDepError "managed"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."streaming" or (buildDepError "streaming"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."websockets" or (buildDepError "websockets"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }