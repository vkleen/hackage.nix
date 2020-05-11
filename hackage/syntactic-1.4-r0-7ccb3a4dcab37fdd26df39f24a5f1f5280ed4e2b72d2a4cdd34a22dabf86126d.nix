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
      identifier = { name = "syntactic"; version = "1.4"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2011-2012, Emil Axelsson";
      maintainer = "emax@chalmers.se";
      author = "Emil Axelsson";
      homepage = "http://projects.haskell.org/syntactic/";
      url = "";
      synopsis = "Generic abstract syntax, and utilities for embedded languages";
      description = "This library provides:\n\n* Generic representation and manipulation of abstract syntax\n\n* Composable AST representations (partly based on Data Types à\nla Carte [1])\n\n* A collection of common syntactic constructs, including\nvariable binding constructs\n\n* Utilities for analyzing and transforming generic abstract\nsyntax\n\n* Utilities for building extensible embedded languages based\non generic syntax\n\nFor more information about the core functionality, see\n\\\"A Generic Abstract Syntax Model for Embedded Languages\\\"\n(ICFP 2012):\n\n* Paper:\n<http://www.cse.chalmers.se/~emax/documents/axelsson2012generic.pdf>\n\n* Slides:\n<http://www.cse.chalmers.se/~emax/documents/axelsson2012generic-slides.pdf>\n\nFor a practical example of how to use the library, see the\nproof-of-concept implementation Feldspar EDSL in the @examples@\ndirectory. (The real Feldspar [2] is also implemented using\nSyntactic.)\n\nThe maturity of this library varies between different modules.\nThe core part (\"Language.Syntactic\") is rather stable, but many\nof the other modules are in a much more experimental state.\n\n\\[1\\] W. Swierstra. Data Types à la Carte.\n/Journal of Functional Programming/, 18(4):423-436, 2008,\n<http://dx.doi.org/10.1017/S0956796808006758>.\n\n\\[2\\] <http://hackage.haskell.org/package/feldspar-language>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."constraints" or (buildDepError "constraints"))
          (hsPkgs."data-hash" or (buildDepError "data-hash"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."tuple" or (buildDepError "tuple"))
          ];
        buildable = true;
        };
      tests = {
        "NanoFeldsparEval" = {
          depends = [
            (hsPkgs."syntactic" or (buildDepError "syntactic"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-th" or (buildDepError "test-framework-th"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        "NanoFeldsparTree" = {
          depends = [
            (hsPkgs."syntactic" or (buildDepError "syntactic"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-golden" or (buildDepError "test-framework-golden"))
            ];
          buildable = true;
          };
        };
      };
    }