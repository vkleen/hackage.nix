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
      specVersion = "1.8";
      identifier = { name = "hindent"; version = "5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2014 Chris Done";
      maintainer = "chrisdone@gmail.com";
      author = "Chris Done, Andrew Gibiansky, Tobias Pflug, Pierre Radermecker";
      homepage = "http://www.github.com/chrisdone/hindent";
      url = "";
      synopsis = "Extensible Haskell pretty printer";
      description = "Extensible Haskell pretty printer. Both a library and an executable.\n\nSee the Github page for usage\\/explanation: <https://github.com/chrisdone/hindent>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      exes = {
        "hindent" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hindent" or (buildDepError "hindent"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."descriptive" or (buildDepError "descriptive"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        "hindent-generate-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hindent" or (buildDepError "hindent"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      tests = {
        "hspec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hindent" or (buildDepError "hindent"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "hindent-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hindent" or (buildDepError "hindent"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }