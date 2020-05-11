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
      specVersion = "1.6";
      identifier = { name = "alpha"; version = "0.999"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "marc.coiffier@gmail.com";
      author = "Marc Coiffier";
      homepage = "http://www.alpha-lang.info/";
      url = "";
      synopsis = "A compiler for the Alpha language";
      description = "Alpha is a programming language that aims at being very simple and\nlow-level, so as to be efficient, while at the same time\nbeing able to climb in abstraction through introspection\nin the Lisp Way.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "alpha" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bimap" or (buildDepError "bimap"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."bindings-posix" or (buildDepError "bindings-posix"))
            (hsPkgs."relation" or (buildDepError "relation"))
            (hsPkgs."AvlTree" or (buildDepError "AvlTree"))
            (hsPkgs."COrdering" or (buildDepError "COrdering"))
            ];
          buildable = true;
          };
        };
      };
    }