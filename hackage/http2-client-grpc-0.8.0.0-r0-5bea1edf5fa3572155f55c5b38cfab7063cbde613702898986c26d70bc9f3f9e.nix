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
      identifier = { name = "http2-client-grpc"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 - 2019 Lucas DiCioccio, Alejandro Serrano";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio, Alejandro Serrano";
      homepage = "https://github.com/haskell-grpc-native/http2-grpc-haskell/blob/master/http2-client-grpc/README.md";
      url = "";
      synopsis = "Implement gRPC-over-HTTP2 clients.";
      description = "A gRPC over http2-client.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."lifted-async" or (buildDepError "lifted-async"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."http2" or (buildDepError "http2"))
          (hsPkgs."http2-client" or (buildDepError "http2-client"))
          (hsPkgs."http2-grpc-types" or (buildDepError "http2-grpc-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tls" or (buildDepError "tls"))
          ];
        buildable = true;
        };
      tests = {
        "http2-client-grpc-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."http2-client-grpc" or (buildDepError "http2-client-grpc"))
            ];
          buildable = true;
          };
        };
      };
    }