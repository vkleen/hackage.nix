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
      specVersion = "1.12";
      identifier = { name = "fortran-src"; version = "0.3.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "me@madgen.net";
      author = "Mistral Contrastin, Matthew Danish, Dominic Orchard, Andrew Rice";
      homepage = "https://github.com/camfort/fortran-src#readme";
      url = "";
      synopsis = "Parser and anlyses for Fortran standards 66, 77, 90 and 95.";
      description = "Provides lexing, parsing, and basic analyses of Fortran code covering standards: FORTRAN 66, FORTRAN 77, Fortran 90, and Fortran 95 and some legacy extensions. Includes data flow and basic block analysis, a renamer, and type analysis. For example usage, see the 'camfort' project, which uses fortran-src as its front end.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."GenericPretty" or (buildDepError "GenericPretty"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."fgl" or (buildDepError "fgl"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.alex or (pkgs.buildPackages.alex or (buildToolDepError "alex")))
          (hsPkgs.buildPackages.happy or (pkgs.buildPackages.happy or (buildToolDepError "happy")))
          ];
        buildable = true;
        };
      exes = {
        "fortran-src" = {
          depends = [
            (hsPkgs."GenericPretty" or (buildDepError "GenericPretty"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fortran-src" or (buildDepError "fortran-src"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."GenericPretty" or (buildDepError "GenericPretty"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fortran-src" or (buildDepError "fortran-src"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            ];
          buildable = true;
          };
        };
      };
    }