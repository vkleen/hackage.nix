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
    flags = { mosaic = false; };
    package = {
      specVersion = "1.14";
      identifier = { name = "rainbox"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2014 Omari Norman";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/rainbox";
      url = "";
      synopsis = "Two-dimensional box pretty printing, with colors";
      description = "Prints boxes in two dimensions, with colors.  Boxes are\nautomatically padded with necessary whitespace.\n\nFor more information, please see the Haddock documentation and\n\n<http://www.github.com/massysett/rainbox";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."rainbow" or (buildDepError "rainbow"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      exes = {
        "rainbox-mosaic" = {
          depends = (pkgs.lib).optionals (flags.mosaic) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
            ];
          buildable = if flags.mosaic then true else false;
          };
        };
      tests = {
        "rainbox-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
            ];
          buildable = true;
          };
        "rainbox-visual" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
            ];
          buildable = true;
          };
        };
      };
    }