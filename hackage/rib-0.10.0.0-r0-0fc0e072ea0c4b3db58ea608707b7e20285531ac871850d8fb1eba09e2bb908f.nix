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
      specVersion = "2.4";
      identifier = { name = "rib"; version = "0.10.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Sridhar Ratnakumar";
      maintainer = "srid@srid.ca";
      author = "Sridhar Ratnakumar";
      homepage = "https://github.com/srid/rib#readme";
      url = "";
      synopsis = "Static site generator based on Shake";
      description = "Haskell static site generator based on Shake, with a delightful development experience.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."base-noprelude" or (buildDepError "base-noprelude"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."clay" or (buildDepError "clay"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."dhall" or (buildDepError "dhall"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."foldl" or (buildDepError "foldl"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."lucid" or (buildDepError "lucid"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."mmark" or (buildDepError "mmark"))
          (hsPkgs."mmark-ext" or (buildDepError "mmark-ext"))
          (hsPkgs."modern-uri" or (buildDepError "modern-uri"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."pandoc-include-code" or (buildDepError "pandoc-include-code"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."relude" or (buildDepError "relude"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."shake" or (buildDepError "shake"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
          (hsPkgs."warp" or (buildDepError "warp"))
          ];
        buildable = true;
        };
      tests = {
        "rib-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base-noprelude" or (buildDepError "base-noprelude"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."clay" or (buildDepError "clay"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."mmark" or (buildDepError "mmark"))
            (hsPkgs."mmark-ext" or (buildDepError "mmark-ext"))
            (hsPkgs."modern-uri" or (buildDepError "modern-uri"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-include-code" or (buildDepError "pandoc-include-code"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }