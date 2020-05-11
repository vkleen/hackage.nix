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
      identifier = { name = "hocker"; version = "1.0.2"; };
      license = "Apache-2.0";
      copyright = "2016 Awake Security";
      maintainer = "opensource@awakesecurity.com";
      author = "Awake Security";
      homepage = "https://github.com/awakesecurity/hocker#readme";
      url = "";
      synopsis = "Interact with the docker registry and generate nix build instructions";
      description = "@hocker@ is a suite of command line utilities and a library for:\n\n* fetching a docker image\n* fetching a layer of an image\n* fetching an image's configuration\n* fetching a docker registry image manifest\n* generating nix build instructions from a registry image manifest\n\nThe motivation for this tool came from a need to fetch docker\nimage artifacts from a docker registry without the stock docker\ntooling that is designed to only work with the docker daemon.\n\nThese tools /only/ work with version 2 of the docker registry and\ndocker version (>=) 1.10.\n\nFor a complete set of usage examples please see the project's <https://github.com/awakesecurity/hocker#readme README.md>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
          (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."concurrentoutput" or (buildDepError "concurrentoutput"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."data-fix" or (buildDepError "data-fix"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."foldl" or (buildDepError "foldl"))
          (hsPkgs."hnix" or (buildDepError "hnix"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."memory" or (buildDepError "memory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."neat-interpolation" or (buildDepError "neat-interpolation"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
          (hsPkgs."pooled-io" or (buildDepError "pooled-io"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."tar" or (buildDepError "tar"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."turtle" or (buildDepError "turtle"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."uri-bytestring" or (buildDepError "uri-bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ];
        buildable = true;
        };
      exes = {
        "hocker-image" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."optional-args" or (buildDepError "optional-args"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "hocker-layer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."optional-args" or (buildDepError "optional-args"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "hocker-config" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."optional-args" or (buildDepError "optional-args"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "hocker-manifest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."optional-args" or (buildDepError "optional-args"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            ];
          buildable = true;
          };
        "docker2nix" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-fix" or (buildDepError "data-fix"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hnix" or (buildDepError "hnix"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."optional-args" or (buildDepError "optional-args"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."optparse-generic" or (buildDepError "optparse-generic"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "hocker-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            (hsPkgs."hocker" or (buildDepError "hocker"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-smallcheck" or (buildDepError "tasty-smallcheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }