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
      specVersion = "1.10";
      identifier = { name = "c2hsc"; version = "0.7.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "John Wiegley <johnw@newartisans.com>";
      author = "John Wiegley";
      homepage = "https://github.com/jwiegley/c2hsc";
      url = "";
      synopsis = "Convert C API header files to .hsc and .hsc.helper.c files";
      description = "Convert C API header files to .hsc and .hsc.helper.c files";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."language-c" or (buildDepError "language-c"))
          (hsPkgs."logging" or (buildDepError "logging"))
          (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "c2hsc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."c2hsc" or (buildDepError "c2hsc"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."language-c" or (buildDepError "language-c"))
            (hsPkgs."logging" or (buildDepError "logging"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."c2hsc" or (buildDepError "c2hsc"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."here" or (buildDepError "here"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."logging" or (buildDepError "logging"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }