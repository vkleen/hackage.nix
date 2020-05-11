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
      identifier = { name = "quipper-tools"; version = "0.9.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2011-2019. All rights reserved.";
      maintainer = "selinger@mathstat.dal.ca";
      author = "Alexander S. Green, Peter LeFanu Lumsdaine, Won Ng,\nNeil J. Ross, Peter Selinger, Benoit Valiron";
      homepage = "http://www.mathstat.dal.ca/~selinger/quipper/";
      url = "";
      synopsis = "Miscellaneous stand-alone tools for Quipper";
      description = "This package provides some stand-alone tools for Quipper, with demos\nfor how to write more such tools.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (buildToolDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (buildToolDepError "Cabal")))
        (hsPkgs.buildPackages.quipper-cabal or (pkgs.buildPackages.quipper-cabal or (buildToolDepError "quipper-cabal")))
        ];
      };
    components = {
      "library" = { buildable = true; };
      exes = {
        "quipper-approximate" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-ascii" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-binary" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-cliffordt" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-depth" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-eps" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-exact" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-gatecount" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-pdf" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-preview" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-simulate" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."newsynth" or (buildDepError "newsynth"))
            (hsPkgs."fixedprec" or (buildDepError "fixedprec"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-standard" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-strict" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-trimcontrols" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-unbox" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quipper-utils" or (buildDepError "quipper-utils"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        "quipper-qclparser" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."quipper-language" or (buildDepError "quipper-language"))
            (hsPkgs."quipper-libraries" or (buildDepError "quipper-libraries"))
            ];
          buildable = true;
          };
        };
      };
    }