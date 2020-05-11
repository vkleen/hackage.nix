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
    flags = { buildexamples = false; buildsynthesizer = false; debug = false; };
    package = {
      specVersion = "1.14";
      identifier = { name = "alsa-pcm"; version = "0.6.1"; };
      license = "BSD-3-Clause";
      copyright = "Bjorn Bringert, Iavor S. Diatchki, Henning Thielemann";
      maintainer = "Henning Thielemann <alsa@henning-thielemann.de>";
      author = "Henning Thielemann <alsa@henning-thielemann.de>, Bjorn Bringert <bjorn@bringert.net>, Iavor S. Diatchki <iavor.diatchki@gmail.com>";
      homepage = "http://www.haskell.org/haskellwiki/ALSA";
      url = "";
      synopsis = "Binding to the ALSA Library API (PCM audio).";
      description = "This package provides access to ALSA realtime audio signal input and output.\nFor MIDI support see alsa-seq.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."alsa-core" or (buildDepError "alsa-core"))
          (hsPkgs."storable-record" or (buildDepError "storable-record"))
          (hsPkgs."sample-frame" or (buildDepError "sample-frame"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        pkgconfig = [ (pkgconfPkgs."alsa" or (pkgConfDepError "alsa")) ];
        buildable = true;
        };
      exes = {
        "alsa-minisynth" = {
          depends = (pkgs.lib).optionals (flags.buildsynthesizer) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."alsa-seq" or (buildDepError "alsa-seq"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."storablevector" or (buildDepError "storablevector"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildsynthesizer then true else false;
          };
        "alsa-sine" = {
          depends = (pkgs.lib).optionals (flags.buildsynthesizer) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."storablevector" or (buildDepError "storablevector"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildsynthesizer then true else false;
          };
        "alsa-duplex" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "alsa-play" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "alsa-record" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "alsa-volume-meter" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."alsa-pcm" or (buildDepError "alsa-pcm"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        };
      };
    }