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
    flags = { benchmark = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "cryptocipher"; version = "0.5.1"; };
      license = "BSD-3-Clause";
      copyright = "Vincent Hanquez <vincent@snarc.org>";
      maintainer = "Vincent Hanquez <vincent@snarc.org>";
      author = "Vincent Hanquez <vincent@snarc.org>";
      homepage = "http://github.com/vincenthz/hs-crypto-cipher";
      url = "";
      synopsis = "Symmetrical block and stream ciphers.";
      description = "Symmetrical block and stream ciphers.\n\nThis package is eventually going away in this form, and should be considered deprecated.\nuse 'cipher-aes' for AES. For blowfish, camellia, DES/3DES, the package is still maintained,\nbut eventually each cipher will be available in another package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."cpu" or (buildDepError "cpu"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."cipher-aes" or (buildDepError "cipher-aes"))
          (hsPkgs."cipher-rc4" or (buildDepError "cipher-rc4"))
          (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          ];
        buildable = true;
        };
      exes = {
        "Benchmarks" = {
          depends = (pkgs.lib).optionals (flags.benchmark) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
            (hsPkgs."cryptocipher" or (buildDepError "cryptocipher"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = if flags.benchmark then true else false;
          };
        };
      tests = {
        "test-cryptocipher" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
            (hsPkgs."cryptocipher" or (buildDepError "cryptocipher"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."entropy" or (buildDepError "entropy"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      };
    }