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
    flags = { dev = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "mida"; version = "1.0.2"; };
      license = "GPL-3.0-only";
      copyright = "Copyright © 2014–2016 Mark Karpov";
      maintainer = "Mark Karpov";
      author = "Mark Karpov";
      homepage = "https://github.com/mrkkrp/mida";
      url = "";
      synopsis = "Language for algorithmic generation of MIDI files";
      description = "MIDA is a minimalistic language for algorithmic generation of MIDI\nfiles. MIDA is not interactive in sense that you cannot control result of\nits activity in real time, it is intended for producers and should be used\nwith a DAW. MIDA can help you create variative elements in your music in a\nvery simple way. Since MIDI can control a lot of different instruments,\npower of MIDA is truly great.\nMain reason for MIDA development is to create software tool that can be\nused in such a way that does not change established workflow, so people\ncould use familiar plugins and software instruments.\nThe core concept of MIDA is building systems with complex behaviors from\nvery basic and easy-to-understand elements and powerful means of their\ncomposition.\nCurrently MIDA can be used to translate source files into .mid files, and\nalso in interactive mode that will help you to understand how MIDA\nlanguage works.\nSee MIDA Manual for more information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tf-random" or (buildDepError "tf-random"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
        buildable = true;
        };
      exes = {
        "mida" = {
          depends = [
            (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."mida" or (buildDepError "mida"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."path" or (buildDepError "path"))
            (hsPkgs."path-io" or (buildDepError "path-io"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."mida" or (buildDepError "mida"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tf-random" or (buildDepError "tf-random"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }