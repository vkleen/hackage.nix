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
      specVersion = "1.8";
      identifier = { name = "labyrinth"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "koterpillar@gmail.com";
      author = "Alexey Kotlyarov";
      homepage = "https://github.com/koterpillar/labyrinth";
      url = "";
      synopsis = "A complicated turn-based game";
      description = "Players take turns in a labyrinth, competing with each\nother to pick a treasure and carry it out. They only know\neveryone's moves and responses, but do not see the map and\nmust deduce it themselves.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."derive" or (buildDepError "derive"))
          (hsPkgs."safecopy" or (buildDepError "safecopy"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          ];
        buildable = true;
        };
      exes = {
        "labyrinth-server" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."safecopy" or (buildDepError "safecopy"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."acid-state" or (buildDepError "acid-state"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
            (hsPkgs."websockets" or (buildDepError "websockets"))
            (hsPkgs."wai-websockets" or (buildDepError "wai-websockets"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."shakespeare-css" or (buildDepError "shakespeare-css"))
            (hsPkgs."shakespeare-js" or (buildDepError "shakespeare-js"))
            (hsPkgs."hamlet" or (buildDepError "hamlet"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."safecopy" or (buildDepError "safecopy"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }