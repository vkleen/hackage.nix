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
      specVersion = "1.14";
      identifier = { name = "prednote-test"; version = "0.26.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2013-2014 Omari Norman";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/prednote";
      url = "";
      synopsis = "Tests and QuickCheck generators to accompany prednote.";
      description = "These are packaged separately so other packages may depend\non them.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."rainbow" or (buildDepError "rainbow"))
          (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."prednote" or (buildDepError "prednote"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."quickpull" or (buildDepError "quickpull"))
          (hsPkgs."barecheck" or (buildDepError "barecheck"))
          ];
        buildable = true;
        };
      exes = {
        "prednote-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."prednote" or (buildDepError "prednote"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."quickpull" or (buildDepError "quickpull"))
            (hsPkgs."barecheck" or (buildDepError "barecheck"))
            ];
          buildable = true;
          };
        "prednote-visual-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."rainbow-tests" or (buildDepError "rainbow-tests"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."prednote" or (buildDepError "prednote"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."quickpull" or (buildDepError "quickpull"))
            (hsPkgs."barecheck" or (buildDepError "barecheck"))
            ];
          buildable = true;
          };
        };
      };
    }