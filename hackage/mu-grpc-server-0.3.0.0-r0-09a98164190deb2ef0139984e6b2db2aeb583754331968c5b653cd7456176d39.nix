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
      identifier = { name = "mu-grpc-server"; version = "0.3.0.0"; };
      license = "Apache-2.0";
      copyright = "Copyright © 2019-2020 <http://47deg.com 47 Degrees>";
      maintainer = "alejandro.serrano@47deg.com";
      author = "Alejandro Serrano, Flavio Corpa";
      homepage = "https://higherkindness.io/mu-haskell/";
      url = "";
      synopsis = "gRPC servers for Mu definitions";
      description = "With @mu-grpc-server@ you can easily build gRPC servers for mu-haskell!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."avro" or (buildDepError "avro"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."http2-grpc-types" or (buildDepError "http2-grpc-types"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mu-grpc-common" or (buildDepError "mu-grpc-common"))
          (hsPkgs."mu-protobuf" or (buildDepError "mu-protobuf"))
          (hsPkgs."mu-rpc" or (buildDepError "mu-rpc"))
          (hsPkgs."mu-schema" or (buildDepError "mu-schema"))
          (hsPkgs."sop-core" or (buildDepError "sop-core"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-conduit" or (buildDepError "stm-conduit"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."warp-grpc" or (buildDepError "warp-grpc"))
          (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
          ];
        buildable = true;
        };
      exes = {
        "grpc-example-server" = {
          depends = [
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."avro" or (buildDepError "avro"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."http2-grpc-types" or (buildDepError "http2-grpc-types"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."mu-grpc-common" or (buildDepError "mu-grpc-common"))
            (hsPkgs."mu-protobuf" or (buildDepError "mu-protobuf"))
            (hsPkgs."mu-rpc" or (buildDepError "mu-rpc"))
            (hsPkgs."mu-schema" or (buildDepError "mu-schema"))
            (hsPkgs."sop-core" or (buildDepError "sop-core"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."stm-conduit" or (buildDepError "stm-conduit"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."warp-grpc" or (buildDepError "warp-grpc"))
            (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
            ];
          buildable = true;
          };
        };
      };
    }