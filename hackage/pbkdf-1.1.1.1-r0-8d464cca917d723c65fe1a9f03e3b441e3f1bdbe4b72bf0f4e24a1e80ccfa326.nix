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
      specVersion = "1.14";
      identifier = { name = "pbkdf"; version = "1.1.1.1"; };
      license = "BSD-3-Clause";
      copyright = "(C) Chris Dornan";
      maintainer = "chris.dornan@irisconnect.com";
      author = "Chris Dornan";
      homepage = "https://github.com/cdornan/pbkdf";
      url = "";
      synopsis = "Haskell implementation of the PBKDF functions from RFC-2898.";
      description = "The Password Based Key Derivation Functions described in RFC-2898 with a test suite to verify that it works with the test vectors published in RFC6070.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          (hsPkgs."bytedump" or (buildDepError "bytedump"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      tests = {
        "rfc-6070" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."byteable" or (buildDepError "byteable"))
            (hsPkgs."bytedump" or (buildDepError "bytedump"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
            (hsPkgs."pbkdf" or (buildDepError "pbkdf"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        };
      };
    }