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
    flags = { executables = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "pinchot"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2015 - 2016 Omari Norman";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/pinchot";
      url = "";
      synopsis = "Write grammars, not parsers";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."Earley" or (buildDepError "Earley"))
          (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."ListLike" or (buildDepError "ListLike"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."non-empty-sequence" or (buildDepError "non-empty-sequence"))
          ];
        buildable = true;
        };
      exes = {
        "newman" = {
          depends = (pkgs.lib).optionals (!(!flags.executables)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."Earley" or (buildDepError "Earley"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."ListLike" or (buildDepError "ListLike"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."non-empty-sequence" or (buildDepError "non-empty-sequence"))
            ];
          buildable = if !flags.executables then false else true;
          };
        "newmanPretty" = {
          depends = (pkgs.lib).optionals (!(!flags.executables)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."Earley" or (buildDepError "Earley"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."ListLike" or (buildDepError "ListLike"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."non-empty-sequence" or (buildDepError "non-empty-sequence"))
            ];
          buildable = if !flags.executables then false else true;
          };
        };
      };
    }