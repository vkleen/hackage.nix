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
      specVersion = "1.6";
      identifier = { name = "json-tools"; version = "0.5.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) Nicolas Pouillard";
      maintainer = "Nicolas Pouillard <nicolas.pouillard@gmail.com>";
      author = "Nicolas Pouillard";
      homepage = "";
      url = "";
      synopsis = "A collection of JSON tools";
      description = "A collection of JSON tools";
      buildType = "Simple";
      };
    components = {
      exes = {
        "json-concat" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "json-deep-select-key" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "json-select" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "json-iter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "json-lines" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "json-strings" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "json-unlines" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "json-wrap" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        "json-xargs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "tar2json" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."string-conversions" or (buildDepError "string-conversions"))
            ];
          buildable = true;
          };
        "json-quote" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "hjq" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."attoparsec-expr" or (buildDepError "attoparsec-expr"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."string-conversions" or (buildDepError "string-conversions"))
            ];
          buildable = true;
          };
        };
      };
    }