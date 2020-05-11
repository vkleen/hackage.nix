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
      pango = false;
      vty = true;
      profiling = false;
      eventlog = false;
      testing = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "yi"; version = "0.11.2"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "yi-devel@googlegroups.com";
      author = "AUTHORS";
      homepage = "http://haskell.org/haskellwiki/Yi";
      url = "";
      synopsis = "The Haskell-Scriptable Editor";
      description = "Yi is a text editor written in Haskell and extensible in Haskell. The goal of the Yi project is\nto provide a flexible, powerful, and correct editor for haskell hacking.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((((([
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cautious-file" or (buildDepError "cautious-file"))
          (hsPkgs."dynamic-state" or (buildDepError "dynamic-state"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."hint" or (buildDepError "hint"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pointedlist" or (buildDepError "pointedlist"))
          (hsPkgs."regex-base" or (buildDepError "regex-base"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."word-trie" or (buildDepError "word-trie"))
          (hsPkgs."yi-language" or (buildDepError "yi-language"))
          (hsPkgs."oo-prototypes" or (buildDepError "oo-prototypes"))
          (hsPkgs."yi-rope" or (buildDepError "yi-rope"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          ] ++ (if compiler.isGhc && (compiler.version).lt "7.8"
          then [
            (hsPkgs."derive" or (buildDepError "derive"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            ]
          else [
            (hsPkgs."binary" or (buildDepError "binary"))
            ])) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"))) ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."Win32" or (buildDepError "Win32"))) ++ (pkgs.lib).optionals (flags.testing) [
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."random" or (buildDepError "random"))
          ]) ++ (pkgs.lib).optionals (flags.pango) [
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."glib" or (buildDepError "glib"))
          (hsPkgs."pango" or (buildDepError "pango"))
          ]) ++ (pkgs.lib).optionals (flags.vty) [
          (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
          (hsPkgs."vty" or (buildDepError "vty"))
          ];
        buildable = true;
        };
      exes = {
        "yi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yi" or (buildDepError "yi"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-suite" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."yi-language" or (buildDepError "yi-language"))
            (hsPkgs."yi-rope" or (buildDepError "yi-rope"))
            (hsPkgs."yi" or (buildDepError "yi"))
            ];
          buildable = true;
          };
        };
      };
    }