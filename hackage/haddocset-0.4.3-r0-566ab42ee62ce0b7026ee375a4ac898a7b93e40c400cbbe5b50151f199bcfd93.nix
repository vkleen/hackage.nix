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
      identifier = { name = "haddocset"; version = "0.4.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014-2017 Hirotomo Moriwaki";
      maintainer = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
      author = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
      homepage = "https://github.com/philopon/haddocset";
      url = "";
      synopsis = "Generate docset of Dash by Haddock haskell documentation tool";
      description = "please read README.md <https://github.com/philopon/haddocset/blob/master/README.md>";
      buildType = "Simple";
      };
    components = {
      exes = {
        "haddocset" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."sqlite-simple" or (buildDepError "sqlite-simple"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            ] ++ (if compiler.isGhc && (compiler.version).ge "7.8"
            then [ (hsPkgs."haddock-api" or (buildDepError "haddock-api")) ]
            else [
              (hsPkgs."haddock" or (buildDepError "haddock"))
              ])) ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
          buildable = true;
          };
        };
      };
    }