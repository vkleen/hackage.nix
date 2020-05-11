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
      identifier = { name = "reflex-transformers"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2015 Oliver Batchelor";
      maintainer = "saulzar@gmail.com";
      author = "Oliver Batchelor";
      homepage = "http://github.com/saulzar/reflex-transformers";
      url = "";
      synopsis = "Collections and switchable Monad transformers for Reflex";
      description = "This library provides a set of Monad transformers (and instances for common transformers) on top of\nwidget switching primitives for reflex. For example ReaderT and WriterT which operate in the presence\nof widget switching, allowing you to pass inputs and outputs up and down the UI tree.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."reflex" or (buildDepError "reflex"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."stateWriter" or (buildDepError "stateWriter"))
          ];
        buildable = true;
        };
      };
    }