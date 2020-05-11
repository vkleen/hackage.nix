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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "haskore"; version = "0.0.5"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Henning Thielemann <haskore@henning-thielemann.de>";
      author = "Paul Hudak <paul.hudak@yale.edu>, Henning Thielemann";
      homepage = "http://www.haskell.org/haskellwiki/Haskore";
      url = "http://darcs.haskell.org/haskore/";
      synopsis = "The Haskore Computer Music System";
      description = "Compose music using programming features.\nOutput in MIDI, CSound, SuperCollider or as a audio signal.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."event-list" or (buildDepError "event-list"))
          (hsPkgs."midi" or (buildDepError "midi"))
          (hsPkgs."markov-chain" or (buildDepError "markov-chain"))
          (hsPkgs."non-negative" or (buildDepError "non-negative"))
          (hsPkgs."data-accessor" or (buildDepError "data-accessor"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."haskell-src" or (buildDepError "haskell-src"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          ] ++ (if flags.splitbase
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."special-functors" or (buildDepError "special-functors"))
            ]);
        buildable = true;
        };
      exes = {
        "test" = { buildable = true; };
        "autotrack" = { buildable = true; };
        };
      };
    }