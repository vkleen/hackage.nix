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
    flags = { testing = false; server = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "scion"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Thomas Schilling <nominolo@googlemail.com>";
      author = "Thomas Schilling <nominolo@googlemail.com>";
      homepage = "http://github.com/nominolo/scion";
      url = "";
      synopsis = "Haskell IDE library";
      description = "Scion is a Haskell library that aims to implement those parts of a\nHaskell IDE which are independent of a particular front-end.  Scion\nis based on the GHC API and Cabal.  It provides both a Haskell API and\na server for non-Haskell clients such as Emacs and Vim.\n\nSee the homepage (http://code.google.com/p/scion-lib/) and the\nREADME\n(http://github.com/nominolo/scion/blob/master/README.markdown) for\nmore information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."ghc-syb" or (buildDepError "ghc-syb"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."json" or (buildDepError "json"))
          (hsPkgs."multiset" or (buildDepError "multiset"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          ] ++ (pkgs.lib).optional (flags.testing) (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"));
        buildable = true;
        };
      exes = {
        "scion-server" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
            (hsPkgs."ghc-syb" or (buildDepError "ghc-syb"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."multiset" or (buildDepError "multiset"))
            (hsPkgs."time" or (buildDepError "time"))
            ] ++ (pkgs.lib).optionals (flags.server) [
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."network-bytestring" or (buildDepError "network-bytestring"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ]) ++ (pkgs.lib).optional (flags.testing) (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"));
          buildable = if !flags.server then false else true;
          };
        };
      };
    }