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
    flags = { ghcid = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "neuron"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2020 Sridhar Ratnakumar";
      maintainer = "srid@srid.ca";
      author = "Sridhar Ratnakumar";
      homepage = "https://neuron.zettel.page";
      url = "";
      synopsis = "Haskell meets Zettelkasten, for your plain-text delight.";
      description = "neuron is a system for managing your plain-text Zettelkasten notes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."relude" or (buildDepError "relude"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."algebraic-graphs" or (buildDepError "algebraic-graphs"))
          (hsPkgs."parser-combinators" or (buildDepError "parser-combinators"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."filepattern" or (buildDepError "filepattern"))
          (hsPkgs."mmark" or (buildDepError "mmark"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          ];
        buildable = true;
        };
      exes = {
        "neuron" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."algebraic-graphs" or (buildDepError "algebraic-graphs"))
            (hsPkgs."parser-combinators" or (buildDepError "parser-combinators"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepattern" or (buildDepError "filepattern"))
            (hsPkgs."mmark" or (buildDepError "mmark"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."clay" or (buildDepError "clay"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."gitrev" or (buildDepError "gitrev"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."rib" or (buildDepError "rib"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."mmark-ext" or (buildDepError "mmark-ext"))
            (hsPkgs."modern-uri" or (buildDepError "modern-uri"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."which" or (buildDepError "which"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
            (hsPkgs."dependent-sum-template" or (buildDepError "dependent-sum-template"))
            (hsPkgs."aeson-gadt-th" or (buildDepError "aeson-gadt-th"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."with-utf8" or (buildDepError "with-utf8"))
            ];
          buildable = true;
          };
        };
      tests = {
        "neuron-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."algebraic-graphs" or (buildDepError "algebraic-graphs"))
            (hsPkgs."parser-combinators" or (buildDepError "parser-combinators"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepattern" or (buildDepError "filepattern"))
            (hsPkgs."mmark" or (buildDepError "mmark"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."clay" or (buildDepError "clay"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."gitrev" or (buildDepError "gitrev"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."rib" or (buildDepError "rib"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."mmark-ext" or (buildDepError "mmark-ext"))
            (hsPkgs."modern-uri" or (buildDepError "modern-uri"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."which" or (buildDepError "which"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
            (hsPkgs."dependent-sum-template" or (buildDepError "dependent-sum-template"))
            (hsPkgs."aeson-gadt-th" or (buildDepError "aeson-gadt-th"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."with-utf8" or (buildDepError "with-utf8"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }