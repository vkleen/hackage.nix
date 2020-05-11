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
      specVersion = "2.2";
      identifier = { name = "RabbitMQ"; version = "0.1.0.0"; };
      license = "BSD-3-Clause AND GPL-3.0-or-later";
      copyright = "";
      maintainer = "hvr@gnu.org";
      author = "Holger Reinhardt, Herbert Valerio Riedel";
      homepage = "";
      url = "";
      synopsis = "AMQP 0-9-1 client library for RabbitMQ servers";
      description = "This library provides an AMQP 0-9-1 client library for <http://www.rabbitmq.com RabbitMQ> servers.\n\nThis library is a fork of the <http://hackage.haskell.org/package/amqp amqp package> based on <http://hackage.haskell.org/package/HsOpenSSL HsOpenSSL> for providing TLS support.\n\nSee \"Network.AMQP\" for documentation and a usage example.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."io-streams" or (buildDepError "io-streams"))
          (hsPkgs."openssl-streams" or (buildDepError "openssl-streams"))
          (hsPkgs."HsOpenSSL" or (buildDepError "HsOpenSSL"))
          ];
        buildable = true;
        };
      };
    }