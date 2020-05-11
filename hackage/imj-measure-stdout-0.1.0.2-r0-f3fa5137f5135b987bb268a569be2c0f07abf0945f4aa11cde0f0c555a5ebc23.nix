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
      identifier = { name = "imj-measure-stdout"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "2017 - 2018 Olivier Sohn";
      maintainer = "olivier.sohn@gmail.com";
      author = "Olivier Sohn";
      homepage = "https://github.com/OlivierSohn/hamazed/blob/master/imj-measure-stdout/README.md";
      url = "";
      synopsis = "An application to determine the maximum capacity of stdout buffer.";
      description = "The program helps you determine the maximum capacity of your stdout buffer.\n\nIt was initially developped to diagnose screen tearing issues\nin a terminal-based game I was developping, and more specifically, to see the\neffect of the following action :\n\n> hSetBuffering stdout \$ BlockBuffering \$ Just maxBound\n\nUsing this program, I found that, on my system, the previous call quadruples\nstdout's capacity, from 2048 to 8192 bytes.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "imj-measure-stdout-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."imj-prelude" or (buildDepError "imj-prelude"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      };
    }