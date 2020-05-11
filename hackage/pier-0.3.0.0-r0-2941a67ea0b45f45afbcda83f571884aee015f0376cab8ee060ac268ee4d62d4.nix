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
      identifier = { name = "pier"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "judah.jacobson@gmail.com";
      author = "";
      homepage = "https://github.com/judah/pier#readme";
      url = "";
      synopsis = "Yet another Haskell build system.";
      description = "Pier is a command-line tool for building Haskell projects.  It is\nsimilar in purpose to <https://www.haskellstack.org Stack>,\nbut explores a different design:\n\n* Pier implements the fine-grained Haskell build logic from (nearly)\nscratch.  In contrast, Stack relies on Cabal to implement most of its\nbuild steps, giving it a more coarse control over the build.\n* Pier uses general-purpose libraries for implementing build systems, namely\n<https://shakebuild.com Shake> and <https://hackage.haskell.org/package/pier-core pier-core>.\n\nFor more information, see the official <https://github.com/judah/pier/blob/master/Readme.md documentation>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "pier" = {
          depends = [
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."binary-orphans" or (buildDepError "binary-orphans"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."pier-core" or (buildDepError "pier-core"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        };
      };
    }