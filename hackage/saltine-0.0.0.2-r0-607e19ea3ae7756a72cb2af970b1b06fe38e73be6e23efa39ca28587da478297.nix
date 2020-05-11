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
      identifier = { name = "saltine"; version = "0.0.0.2"; };
      license = "MIT";
      copyright = "Copyright (c) Joseph Abrahamson 2013";
      maintainer = "Joseph Abrahamson <me@jspha.com>";
      author = "Joseph Abrahamson";
      homepage = "";
      url = "";
      synopsis = "Cryptography that's easy to digest (NaCl/libsodium bindings).";
      description = "/NaCl/ (pronounced \\\"salt\\\") is a new easy-to-use high-speed software\nlibrary for network communica tion, encryption, decryption,\nsignatures, etc. NaCl's goal is to provide all of the core\noperations needed to build higher-level cryptographic tools.\n\n<http://nacl.cr.yp.to/>\n\n/Sodium/ is a portable, cross-compilable, installable, packageable\ncrypto library based on NaCl, with a compatible API.\n\n<https://github.com/jedisct1/libsodium>\n\n/Saltine/ is a Haskell binding to the NaCl primitives going through\nSodium for build convenience and, eventually, portability.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          ];
        libs = [ (pkgs."sodium" or (sysDepError "sodium")) ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."saltine" or (buildDepError "saltine"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            ];
          buildable = true;
          };
        };
      };
    }