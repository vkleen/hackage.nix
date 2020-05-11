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
      specVersion = "2.2";
      identifier = { name = "addy"; version = "0.1.0.0"; };
      license = "BSD-2-Clause";
      copyright = "Copyright (c) 2019-2020 Peter Jones";
      maintainer = "Peter Jones <pjones@devalot.com>";
      author = "Peter Jones <pjones@devalot.com>";
      homepage = "https://github.com/pjones/addy";
      url = "";
      synopsis = "A full-featured library for parsing, validating, and rendering email addresses";
      description = "A modern library for working with email addresses.  This package can\nbe used to validate user input or handle various flavors of\naddresses that appear in places such as mail messages.\n\nEmail addresses can be decoded, manipulated, then rendered back to\ntext using the simple @local-part\\@domain@ format or the more\ncomplete syntax that allows for display names and comments.\n\nComprehensive documentation can be found in the \"Addy\" module.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."ip" or (buildDepError "ip"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."relude" or (buildDepError "relude"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-icu" or (buildDepError "text-icu"))
          (hsPkgs."validation-selective" or (buildDepError "validation-selective"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ip" or (buildDepError "ip"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."text-icu" or (buildDepError "text-icu"))
            (hsPkgs."validation-selective" or (buildDepError "validation-selective"))
            (hsPkgs."addy" or (buildDepError "addy"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hedgehog" or (buildDepError "tasty-hedgehog"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }