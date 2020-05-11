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
      identifier = { name = "stack-hpc-coveralls"; version = "0.0.4.0"; };
      license = "ISC";
      copyright = "Copyright (c) 2015 Michele Lacchia";
      maintainer = "michelelacchia@gmail.com";
      author = "Michele Lacchia";
      homepage = "http://github.com/rubik/stack-hpc-coveralls";
      url = "";
      synopsis = "Initial project template from stack";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hpc" or (buildDepError "hpc"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "shc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."docopt" or (buildDepError "docopt"))
            (hsPkgs."stack-hpc-coveralls" or (buildDepError "stack-hpc-coveralls"))
            ];
          buildable = true;
          };
        };
      tests = {
        "shc-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."stack-hpc-coveralls" or (buildDepError "stack-hpc-coveralls"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-contrib" or (buildDepError "hspec-contrib"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."hpc" or (buildDepError "hpc"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        "style" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hlint" or (buildDepError "hlint"))
            ];
          buildable = true;
          };
        };
      };
    }