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
      identifier = { name = "chart-unit"; version = "0.5.0"; };
      license = "BSD-3-Clause";
      copyright = "2016 Tony Day";
      maintainer = "tonyday567@gmail.com";
      author = "Tony Day";
      homepage = "https://github.com/tonyday567/chart-unit";
      url = "";
      synopsis = "Native haskell charts.";
      description = "See <https://tonyday567.github.io/chart-unit/index.html chart-unit> for chart bling and usage.\n\n\n![example](other/mainExample.svg)\n\nThese charts are designed to be scale independent and amenable to combinatory busywork (hence the unit suffix).\n\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."palette" or (buildDepError "palette"))
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          (hsPkgs."diagrams-svg" or (buildDepError "diagrams-svg"))
          (hsPkgs."foldl" or (buildDepError "foldl"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."linear" or (buildDepError "linear"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."numhask" or (buildDepError "numhask"))
          (hsPkgs."numhask-range" or (buildDepError "numhask-range"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."SVGFonts" or (buildDepError "SVGFonts"))
          ];
        buildable = true;
        };
      exes = {
        "chart-source-examples" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."chart-unit" or (buildDepError "chart-unit"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mwc-probability" or (buildDepError "mwc-probability"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."numhask" or (buildDepError "numhask"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."tdigest" or (buildDepError "tdigest"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."diagrams-rasterific" or (buildDepError "diagrams-rasterific"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."chart-unit" or (buildDepError "chart-unit"))
            (hsPkgs."numhask" or (buildDepError "numhask"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hspec" or (buildDepError "tasty-hspec"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }