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
    flags = { with-http = true; cross = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "dhall"; version = "1.27.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Gabriel Gonzalez";
      maintainer = "Gabriel439@gmail.com";
      author = "Gabriel Gonzalez";
      homepage = "";
      url = "";
      synopsis = "A configuration language guaranteed to terminate";
      description = "Dhall is an explicitly typed configuration language that is not Turing\ncomplete.  Despite being Turing incomplete, Dhall is a real programming\nlanguage with a type-checker and evaluator.\n\nUse this library to parse, type-check, evaluate, and pretty-print the Dhall\nconfiguration language.  This package also includes an executable which\ntype-checks a Dhall file and reduces the file to a fully evaluated normal\nform.\n\nRead \"Dhall.Tutorial\" to learn how to use this library";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."cborg" or (buildDepError "cborg"))
          (hsPkgs."cborg-json" or (buildDepError "cborg-json"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."data-fix" or (buildDepError "data-fix"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."Diff" or (buildDepError "Diff"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."dotgen" or (buildDepError "dotgen"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."lens-family-core" or (buildDepError "lens-family-core"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."memory" or (buildDepError "memory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."parsers" or (buildDepError "parsers"))
          (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
          (hsPkgs."prettyprinter-ansi-terminal" or (buildDepError "prettyprinter-ansi-terminal"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."repline" or (buildDepError "repline"))
          (hsPkgs."serialise" or (buildDepError "serialise"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."uri-encode" or (buildDepError "uri-encode"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ] ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0") && !(compiler.isEta && (compiler.version).ge "0.8.4")) [
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."fail" or (buildDepError "fail"))
          ]) ++ (if compiler.isGhcjs && true
          then [
            (hsPkgs."ghcjs-base" or (buildDepError "ghcjs-base"))
            (hsPkgs."ghcjs-xhr" or (buildDepError "ghcjs-xhr"))
            ]
          else [
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            ] ++ (pkgs.lib).optionals (flags.with-http) [
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            ]);
        buildable = true;
        };
      exes = {
        "dhall" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tasty" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cborg" or (buildDepError "cborg"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-fix" or (buildDepError "data-fix"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."generic-random" or (buildDepError "generic-random"))
            (hsPkgs."lens-family-core" or (buildDepError "lens-family-core"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."serialise" or (buildDepError "serialise"))
            (hsPkgs."special-values" or (buildDepError "special-values"))
            (hsPkgs."spoon" or (buildDepError "spoon"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."turtle" or (buildDepError "turtle"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mockery" or (buildDepError "mockery"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = if compiler.isGhc && (compiler.version).lt "8.0"
            then false
            else true;
          };
        };
      benchmarks = {
        "dhall-parser" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            (hsPkgs."serialise" or (buildDepError "serialise"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "deep-nested-large-record" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            ];
          buildable = true;
          };
        };
      };
    }