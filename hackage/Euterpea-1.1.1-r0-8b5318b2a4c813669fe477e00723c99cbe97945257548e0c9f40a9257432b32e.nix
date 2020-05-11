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
      identifier = { name = "Euterpea"; version = "1.1.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2008-2015 Paul Hudak";
      maintainer = "Donya Quick <donya.quick@yale.edu>,\nDan Winograd-Cort <daniel.winograd-cort@yale.edu>,\nMark Santolucito <mark.santolucito@yale.edu>";
      author = "Paul Hudak <paul.hudak@yale.edu>,\nEric Cheng <eric.cheng@aya.yale.edu>,\nHai (Paul) Liu <hai.liu@aya.yale.edu>";
      homepage = "http://haskell.cs.yale.edu/";
      url = "";
      synopsis = "Library for computer music research and education";
      description = "Euterpea is a domain-specific language embedded in Haskell for\ncomputer music research, education, and development, providing\nboth note-level and signal-level abstractions.  It is a descendant\nof Haskore and HasSound, and is intended for both educational purposes\nas well as serious computer music applications.  Euterpea is a\nwide-spectrum DSL, suitable for high-level music representation,\nalgorithmic composition, and analysis; mid-level concepts such as\nMIDI; and low-level audio processing, sound synthesis, and instrument\ndesign.  It also includes a \"musical user interface,\" a set of\ncomputer-music specific GUI widgets such as keyboards, pushbuttons,\nsliders, and so on.  The performance of Euterpea is intended to be\nas good as any other computer music language, with the goal of being\nable to develop real-time applications, using both MIDI and a\nhigh-performance back-end for real-time audio.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."arrows" or (buildDepError "arrows"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."PortMidi" or (buildDepError "PortMidi"))
          (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."heap" or (buildDepError "heap"))
          (hsPkgs."markov-chain" or (buildDepError "markov-chain"))
          (hsPkgs."pure-fft" or (buildDepError "pure-fft"))
          (hsPkgs."UISF" or (buildDepError "UISF"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "6.10") [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      tests = {
        "test-euterpea" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Euterpea" or (buildDepError "Euterpea"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            ];
          buildable = true;
          };
        };
      };
    }