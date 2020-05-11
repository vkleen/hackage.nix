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
      identifier = { name = "hedra"; version = "0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "tanyi.viktor@gmail.com";
      author = "Viktor Tanyi";
      homepage = "https://github.com/vtan/hedra";
      url = "";
      synopsis = "A small library and executable for generating dice rolls.";
      description = "As in polyhedra. Generates dice rolls in the REPL or in a standalone executable.\n\nExample REPL session:\n\n> \$ cabal v2-repl\n> λ> 2 `d` 8\n> 8 | 1 7\n> λ> 1 `d` 20\n> 13\n> λ> 1 `d` 100\n> 25 | 20 5\n> λ> 4 `d` f\n> 3 | [ ] [+] [+] [+]\n\nExample session in the executable:\n\n> \$ cabal v2-run hedra\n> hedra> 2d8\n> 2d8: 14 | 6 8\n> hedra> 1d20\n> 1d20: 1\n> hedra> d20\n> d20: 5\n> hedra> d100\n> d100: 61 | 60 1\n> hedra> d%\n> d%: 5 | 00 5\n> hedra> 4df\n> 4df: 2 | [ ] [+] [+] [ ]";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      exes = {
        "hedra" = {
          depends = [
            (hsPkgs."hedra" or (buildDepError "hedra"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            ];
          buildable = true;
          };
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."hedra" or (buildDepError "hedra"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }