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
      identifier = { name = "yesod-articles"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "mattaeads@gmail.com";
      author = "Matthew Eads";
      homepage = "https://github.com/matthew-eads/yesod-articles";
      url = "";
      synopsis = "Automatically generate article previews for a yesod site";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."yesod" or (buildDepError "yesod"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."dates" or (buildDepError "dates"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."dates" or (buildDepError "dates"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."th-lift-instances" or (buildDepError "th-lift-instances"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
            (hsPkgs."yesod-articles" or (buildDepError "yesod-articles"))
            ];
          buildable = true;
          };
        };
      };
    }