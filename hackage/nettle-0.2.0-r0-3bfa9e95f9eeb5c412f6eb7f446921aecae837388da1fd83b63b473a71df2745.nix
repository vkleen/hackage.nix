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
    flags = { usepkgconfig = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "nettle"; version = "0.2.0"; };
      license = "MIT";
      copyright = "Stefan Bühler <stbuehler@web.de>";
      maintainer = "Stefan Bühler <stbuehler@web.de>";
      author = "Stefan Bühler <stbuehler@web.de>";
      homepage = "https://github.com/stbuehler/haskell-nettle";
      url = "";
      synopsis = "safe nettle binding";
      description = "safe binding for the nettle (<http://www.lysator.liu.se/~nisse/nettle/nettle.html>) library.\nTested with 3.1.1, might work with 3.0, does NOT WORK with 2.x.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."securemem" or (buildDepError "securemem"))
          (hsPkgs."crypto-cipher-types" or (buildDepError "crypto-cipher-types"))
          ];
        libs = (pkgs.lib).optional (!flags.usepkgconfig) (pkgs."nettle" or (sysDepError "nettle"));
        pkgconfig = (pkgs.lib).optional (flags.usepkgconfig) (pkgconfPkgs."nettle" or (pkgConfDepError "nettle"));
        buildable = true;
        };
      tests = {
        "test-ciphers" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."crypto-cipher-types" or (buildDepError "crypto-cipher-types"))
            (hsPkgs."crypto-cipher-tests" or (buildDepError "crypto-cipher-tests"))
            (hsPkgs."nettle" or (buildDepError "nettle"))
            ];
          buildable = true;
          };
        "test-hashes" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."nettle" or (buildDepError "nettle"))
            ];
          buildable = true;
          };
        "test-hmac" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."nettle" or (buildDepError "nettle"))
            ];
          buildable = true;
          };
        "test-umac" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."nettle" or (buildDepError "nettle"))
            ];
          buildable = true;
          };
        };
      };
    }