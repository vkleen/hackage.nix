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
      identifier = { name = "wolf"; version = "0.2.13"; };
      license = "MIT";
      copyright = "Copyright (C) 2015 Swift Navigation, Inc.";
      maintainer = "Mark Fine <dev@swiftnav.com>";
      author = "Swift Navigation Inc.";
      homepage = "https://github.com/swift-nav/wolf";
      url = "";
      synopsis = "Amazon Simple Workflow Service Wrapper.";
      description = "Wolf is a wrapper around Amazon Simple Workflow Service.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."amazonka" or (buildDepError "amazonka"))
          (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
          (hsPkgs."amazonka-s3" or (buildDepError "amazonka-s3"))
          (hsPkgs."amazonka-swf" or (buildDepError "amazonka-swf"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mtl-compat" or (buildDepError "mtl-compat"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."regex-applicative" or (buildDepError "regex-applicative"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "wolf-register" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-execute" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-decide" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            ];
          buildable = true;
          };
        "wolf-act" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ];
          buildable = true;
          };
        "wolf-act2" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basic-prelude" or (buildDepError "basic-prelude"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."wolf" or (buildDepError "wolf"))
            ];
          buildable = true;
          };
        };
      };
    }