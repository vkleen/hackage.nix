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
      identifier = { name = "network-msgpack-rpc"; version = "0.0.6"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2009-2016, Hideyuki Tanaka";
      maintainer = "Iphigenia Df <iphydf@gmail.com>";
      author = "Hideyuki Tanaka";
      homepage = "http://msgpack.org/";
      url = "";
      synopsis = "A MessagePack-RPC Implementation";
      description = "A MessagePack-RPC Implementation <http://msgpack.org/>\n\nThis is a fork of msgpack-haskell <https://github.com/msgpack/msgpack-haskell>,\nsince the original author is unreachable. This fork incorporates a number of\nbugfixes and is actively being developed.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."binary-conduit" or (buildDepError "binary-conduit"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."data-default-instances-base" or (buildDepError "data-default-instances-base"))
          (hsPkgs."data-msgpack" or (buildDepError "data-msgpack"))
          (hsPkgs."data-msgpack-types" or (buildDepError "data-msgpack-types"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          ];
        buildable = true;
        };
      tests = {
        "testsuite" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."network-msgpack-rpc" or (buildDepError "network-msgpack-rpc"))
            ];
          buildable = true;
          };
        };
      };
    }