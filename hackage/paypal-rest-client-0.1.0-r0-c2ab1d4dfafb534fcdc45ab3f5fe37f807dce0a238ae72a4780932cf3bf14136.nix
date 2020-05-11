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
      identifier = { name = "paypal-rest-client"; version = "0.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "vc@braden-walters.info";
      author = "Braden Walters";
      homepage = "https://github.com/meoblast001/paypal-rest-client";
      url = "";
      synopsis = "A client to connect to PayPal's REST API (v1)";
      description = "Library to connect with and use PayPal's\n<https://developer.paypal.com/docs/api/ REST API v1>. For documentation, see\nthe <https://github.com/meoblast001/paypal-rest-client/blob/master/README.md README>.\nDuring releases under 1.0.0, please use exact version numbers as bug fixes may\nrequire breaking changes while this library is unstable.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."Decimal" or (buildDepError "Decimal"))
          (hsPkgs."country-codes" or (buildDepError "country-codes"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }