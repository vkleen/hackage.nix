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
      specVersion = "1.6";
      identifier = { name = "tls-debug"; version = "0.2.2"; };
      license = "BSD-3-Clause";
      copyright = "Vincent Hanquez <vincent@snarc.org>";
      maintainer = "Vincent Hanquez <vincent@snarc.org>";
      author = "Vincent Hanquez <vincent@snarc.org>";
      homepage = "http://github.com/vincenthz/hs-tls";
      url = "";
      synopsis = "Set of programs for TLS testing and debugging";
      description = "A set of program to test and debug various aspect of the TLS package.\n";
      buildType = "Simple";
      };
    components = {
      exes = {
        "tls-stunnel" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."certificate" or (buildDepError "certificate"))
            (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
            (hsPkgs."tls" or (buildDepError "tls"))
            (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
            ];
          buildable = true;
          };
        "tls-checkciphers" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
            (hsPkgs."certificate" or (buildDepError "certificate"))
            (hsPkgs."tls" or (buildDepError "tls"))
            (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
            ];
          buildable = true;
          };
        "tls-retrievecertificate" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
            (hsPkgs."certificate" or (buildDepError "certificate"))
            (hsPkgs."tls" or (buildDepError "tls"))
            (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
            ];
          buildable = true;
          };
        "tls-simpleclient" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
            (hsPkgs."certificate" or (buildDepError "certificate"))
            (hsPkgs."tls" or (buildDepError "tls"))
            (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
            ];
          buildable = true;
          };
        };
      };
    }