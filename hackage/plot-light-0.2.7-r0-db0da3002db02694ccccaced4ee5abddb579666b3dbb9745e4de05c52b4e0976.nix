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
      specVersion = "1.18";
      identifier = { name = "plot-light"; version = "0.2.7"; };
      license = "BSD-3-Clause";
      copyright = "2017 Marco Zocca";
      maintainer = "zocca marco gmail";
      author = "Marco Zocca";
      homepage = "https://github.com/ocramz/plot-light";
      url = "";
      synopsis = "A lightweight plotting library, exporting to SVG";
      description = "This library provides drawing and plotting datastructures and functions; it is aimed in particular at scientific visualization, but it also exposes its plotting primitives and a general purpose 2D geometry library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."palette" or (buildDepError "palette"))
          (hsPkgs."blaze-svg" or (buildDepError "blaze-svg"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          ];
        buildable = true;
        };
      exes = {
        "scatter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."plot-light" or (buildDepError "plot-light"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."colour" or (buildDepError "colour"))
            (hsPkgs."blaze-svg" or (buildDepError "blaze-svg"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            ];
          buildable = true;
          };
        "timeseries" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."plot-light" or (buildDepError "plot-light"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."attoparsec-time" or (buildDepError "attoparsec-time"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."colour" or (buildDepError "colour"))
            (hsPkgs."blaze-svg" or (buildDepError "blaze-svg"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            ];
          buildable = true;
          };
        "heatmap" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."plot-light" or (buildDepError "plot-light"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."attoparsec-time" or (buildDepError "attoparsec-time"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."colour" or (buildDepError "colour"))
            (hsPkgs."palette" or (buildDepError "palette"))
            (hsPkgs."blaze-svg" or (buildDepError "blaze-svg"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."plot-light" or (buildDepError "plot-light"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }