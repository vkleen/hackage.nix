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
    flags = { tls_1_1_3 = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "warp-tls"; version = "2.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman";
      homepage = "http://github.com/yesodweb/wai";
      url = "";
      synopsis = "HTTP over SSL/TLS support for Warp via the TLS package";
      description = "HTTP over SSL/TLS support for Warp via the TLS package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."network-conduit" or (buildDepError "network-conduit"))
          (hsPkgs."certificate" or (buildDepError "certificate"))
          (hsPkgs."pem" or (buildDepError "pem"))
          (hsPkgs."cryptocipher" or (buildDepError "cryptocipher"))
          (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
          (hsPkgs."tls" or (buildDepError "tls"))
          (hsPkgs."crypto-random-api" or (buildDepError "crypto-random-api"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
          ] ++ [
          (hsPkgs."tls" or (buildDepError "tls"))
          (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
          ];
        buildable = true;
        };
      };
    }