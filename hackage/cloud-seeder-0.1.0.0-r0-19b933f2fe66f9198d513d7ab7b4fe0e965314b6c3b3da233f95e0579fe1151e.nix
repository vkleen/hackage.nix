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
      identifier = { name = "cloud-seeder"; version = "0.1.0.0"; };
      license = "ISC";
      copyright = "2017 CJ Affiliate by Conversant";
      maintainer = "Alexis King <lexi.lambda@gmail.com>, Michael Arnold <michaelaarnold@gmail.com>";
      author = "Alexis King <lexi.lambda@gmail.com>, Michael Arnold <michaelaarnold@gmail.com>";
      homepage = "https://github.com/cjdev/cloud-seeder#readme";
      url = "";
      synopsis = "A tool for interacting with AWS CloudFormation";
      description = "This package provides a DSL for creating deployment configurations, as well\nas an interpreter that reads deployment configurations in order to deploy\napplication stacks to AWS CloudFormation using Amazonka.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."amazonka" or (buildDepError "amazonka"))
          (hsPkgs."amazonka-cloudformation" or (buildDepError "amazonka-cloudformation"))
          (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        buildable = true;
        };
      tests = {
        "cloud-seeder-test-suite" = {
          depends = [
            (hsPkgs."amazonka-cloudformation" or (buildDepError "amazonka-cloudformation"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cloud-seeder" or (buildDepError "cloud-seeder"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."monad-mock" or (buildDepError "monad-mock"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        };
      };
    }