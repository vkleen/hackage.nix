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
      identifier = { name = "scotty-fay"; version = "0.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Harry Garrood <harry@garrood.me>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Fay integration for Scotty.";
      description = "Fay integration for Scotty. For more information, please see <https://github.com/hdgarrood/scotty-fay>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."scotty" or (buildDepError "scotty"))
          (hsPkgs."fay" or (buildDepError "fay"))
          (hsPkgs."fay-jquery" or (buildDepError "fay-jquery"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."directory" or (buildDepError "directory"))
          ];
        buildable = true;
        };
      tests = {
        "scotty-fay-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."scotty-fay" or (buildDepError "scotty-fay"))
            (hsPkgs."wai-test" or (buildDepError "wai-test"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."scotty" or (buildDepError "scotty"))
            ];
          buildable = true;
          };
        };
      };
    }