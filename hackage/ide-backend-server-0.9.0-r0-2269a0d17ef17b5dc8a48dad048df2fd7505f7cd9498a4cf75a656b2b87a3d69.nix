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
      identifier = { name = "ide-backend-server"; version = "0.9.0"; };
      license = "MIT";
      copyright = "(c) 2015 FP Complete";
      maintainer = "Duncan Coutts <duncan@well-typed.com>";
      author = "Duncan Coutts, Mikolaj Konarski, Edsko de Vries";
      homepage = "";
      url = "";
      synopsis = "An IDE backend server";
      description = "Server executable used internally by the ide-backend library.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ide-backend-server" = {
          depends = (([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-accessor" or (buildDepError "data-accessor"))
            (hsPkgs."data-accessor-mtl" or (buildDepError "data-accessor-mtl"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."filemanip" or (buildDepError "filemanip"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."ide-backend-common" or (buildDepError "ide-backend-common"))
            ] ++ (pkgs.lib).optionals (compiler.isGhc && false) [
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."haddock" or (buildDepError "haddock"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            ]) ++ (pkgs.lib).optionals (compiler.isGhc && false) [
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."haddock-api" or (buildDepError "haddock-api"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            ]) ++ (pkgs.lib).optionals (compiler.isGhc && false) [
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."haddock-api" or (buildDepError "haddock-api"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            ];
          buildable = true;
          };
        };
      };
    }