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
      identifier = { name = "neet"; version = "0.3.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Copyright (C) 2015 Leon Medvinsky";
      maintainer = "lmedvinsky@hotmail.com";
      author = "Leon Medvinsky";
      homepage = "https://github.com/raymoo/NEET";
      url = "";
      synopsis = "A NEAT library for Haskell";
      description = "This package provides functions for creating, training, and using NEAT neural\nnetworks.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."multimap" or (buildDepError "multimap"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."graphviz" or (buildDepError "graphviz"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          ];
        buildable = true;
        };
      };
    }