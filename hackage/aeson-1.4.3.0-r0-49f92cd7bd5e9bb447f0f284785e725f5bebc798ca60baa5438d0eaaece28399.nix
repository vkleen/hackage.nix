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
      developer = false;
      fast = false;
      bytestring-builder = false;
      cffi = false;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "aeson"; version = "1.4.3.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2011-2016 Bryan O'Sullivan\n(c) 2011 MailRank, Inc.";
      maintainer = "Adam Bergmark <adam@bergmark.nl>";
      author = "Bryan O'Sullivan <bos@serpentine.com>";
      homepage = "https://github.com/bos/aeson";
      url = "";
      synopsis = "Fast JSON parsing and encoding";
      description = "A JSON parsing and encoding library optimized for ease of use\nand high performance.\n\nTo get started, see the documentation for the @Data.Aeson@ module\nbelow.\n\n(A note on naming: in Greek mythology, Aeson was the father of Jason.)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."th-abstraction" or (buildDepError "th-abstraction"))
          (hsPkgs."time-locale-compat" or (buildDepError "time-locale-compat"))
          (hsPkgs."uuid-types" or (buildDepError "uuid-types"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ] ++ (if flags.bytestring-builder
          then [
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bytestring-builder" or (buildDepError "bytestring-builder"))
            ]
          else [
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ])) ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.6")) (hsPkgs."contravariant" or (buildDepError "contravariant"))) ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          (hsPkgs."fail" or (buildDepError "fail"))
          ]) ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "7.10")) [
          (hsPkgs."nats" or (buildDepError "nats"))
          (hsPkgs."void" or (buildDepError "void"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = ((([
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."integer-logarithms" or (buildDepError "integer-logarithms"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."base-orphans" or (buildDepError "base-orphans"))
            (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."dlist" or (buildDepError "dlist"))
            (hsPkgs."Diff" or (buildDepError "Diff"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."generic-deriving" or (buildDepError "generic-deriving"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."time-locale-compat" or (buildDepError "time-locale-compat"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."uuid-types" or (buildDepError "uuid-types"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            ] ++ (if flags.bytestring-builder
            then [
              (hsPkgs."bytestring" or (buildDepError "bytestring"))
              (hsPkgs."bytestring-builder" or (buildDepError "bytestring-builder"))
              ]
            else [
              (hsPkgs."bytestring" or (buildDepError "bytestring"))
              ])) ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
            ]) ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "7.10")) [
            (hsPkgs."nats" or (buildDepError "nats"))
            (hsPkgs."void" or (buildDepError "void"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "7.8") (hsPkgs."hashable-time" or (buildDepError "hashable-time"));
          buildable = true;
          };
        };
      };
    }