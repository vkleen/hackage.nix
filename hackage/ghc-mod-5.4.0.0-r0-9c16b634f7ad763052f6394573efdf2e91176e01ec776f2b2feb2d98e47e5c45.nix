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
      specVersion = "1.14";
      identifier = { name = "ghc-mod"; version = "5.4.0.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "Daniel Gröber <dxld@darkboxed.org>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>,\nDaniel Gröber <dxld@darkboxed.org>,\nAlejandro Serrano <trupill@gmail.com>";
      homepage = "http://www.mew.org/~kazu/proj/ghc-mod/";
      url = "";
      synopsis = "Happy Haskell Programming";
      description = "ghc-mod is a backend program to enrich Haskell programming in editors. It\nstrives to offer most of the features one has come to expect from modern IDEs\nin any editor.\nghc-mod provides a library for other haskell programs to use as well as a\nstandalone program for easy editor integration. All of the fundamental\nfunctionality of the frontend program can be accessed through the library\nhowever many implementation details are hidden and if you want to\nsignificantly extend ghc-mod you should submit these changes upstream instead\nof implementing them on top of the library.\nFor more information, please see its home page.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cabal-helper" or (buildDepError "cabal-helper"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."ghc-syb-utils" or (buildDepError "ghc-syb-utils"))
          (hsPkgs."hlint" or (buildDepError "hlint"))
          (hsPkgs."monad-journal" or (buildDepError "monad-journal"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."djinn-ghc" or (buildDepError "djinn-ghc"))
          (hsPkgs."fclabels" or (buildDepError "fclabels"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.8") (hsPkgs."convertible" or (buildDepError "convertible"))) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).lt "7.5") [
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      exes = {
        "ghc-mod" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."fclabels" or (buildDepError "fclabels"))
            (hsPkgs."ghc-mod" or (buildDepError "ghc-mod"))
            ];
          buildable = true;
          };
        "ghc-modi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        };
      tests = {
        "doctest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = if compiler.isGhc && false then false else true;
          };
        "spec" = {
          depends = [
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && false) (hsPkgs."executable-path" or (buildDepError "executable-path"));
          buildable = true;
          };
        };
      };
    }