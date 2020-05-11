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
      identifier = { name = "wai-extra"; version = "0.4.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman";
      homepage = "http://github.com/yesodweb/wai";
      url = "";
      synopsis = "Provides some basic WAI handlers and middleware.";
      description = "The goal here is to provide common features without many dependencies.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."zlib-bindings" or (buildDepError "zlib-bindings"))
          (hsPkgs."blaze-builder-enumerator" or (buildDepError "blaze-builder-enumerator"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."enumerator" or (buildDepError "enumerator"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          ];
        buildable = true;
        };
      tests = {
        "runtests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-test" or (buildDepError "wai-test"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."enumerator" or (buildDepError "enumerator"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."zlib-bindings" or (buildDepError "zlib-bindings"))
            (hsPkgs."blaze-builder-enumerator" or (buildDepError "blaze-builder-enumerator"))
            (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
            ];
          buildable = true;
          };
        };
      };
    }