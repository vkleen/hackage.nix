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
    flags = { double = false; old-locale = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "hledger-lib"; version = "0.27"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Simon Michael <simon@joyful.com>";
      author = "Simon Michael <simon@joyful.com>";
      homepage = "http://hledger.org";
      url = "";
      synopsis = "Core data types, parsers and functionality for the hledger accounting tools";
      description = "This is a reusable library containing hledger's core functionality.\nhledger is a cross-platform program for tracking money, time, or\nany other commodity, using double-entry accounting and a simple,\neditable file format. It is inspired by and largely compatible\nwith ledger(1).  hledger provides command-line, curses and web\ninterfaces, and aims to be a reliable, practical tool for daily\nuse.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."csv" or (buildDepError "csv"))
          (hsPkgs."Decimal" or (buildDepError "Decimal"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mtl-compat" or (buildDepError "mtl-compat"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."uglymemo" or (buildDepError "uglymemo"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "7.4") (hsPkgs."pretty-show" or (buildDepError "pretty-show"))) ++ (if flags.old-locale
          then [
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            ]
          else [ (hsPkgs."time" or (buildDepError "time")) ]);
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."csv" or (buildDepError "csv"))
            (hsPkgs."Decimal" or (buildDepError "Decimal"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."mtl-compat" or (buildDepError "mtl-compat"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."uglymemo" or (buildDepError "uglymemo"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "7.4") (hsPkgs."pretty-show" or (buildDepError "pretty-show"))) ++ (if flags.old-locale
            then [
              (hsPkgs."time" or (buildDepError "time"))
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              ]
            else [ (hsPkgs."time" or (buildDepError "time")) ]);
          buildable = true;
          };
        };
      };
    }