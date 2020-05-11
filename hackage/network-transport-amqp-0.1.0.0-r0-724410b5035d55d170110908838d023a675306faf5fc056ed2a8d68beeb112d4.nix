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
    flags = { distributed-process-tests = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "network-transport-amqp"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "alfredo.dinapoli@gmail.com";
      author = "Alfredo Di Napoli";
      homepage = "";
      url = "";
      synopsis = "AMQP-based transport layer for distributed-process (aka Cloud Haskell)";
      description = "AMQP-based transport layer for distributed-process (aka Cloud Haskell)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."amqp" or (buildDepError "amqp"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."string-conv" or (buildDepError "string-conv"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-chans" or (buildDepError "stm-chans"))
          (hsPkgs."network-transport" or (buildDepError "network-transport"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."lens-family" or (buildDepError "lens-family"))
          (hsPkgs."lens-family-th" or (buildDepError "lens-family-th"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.8") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      tests = {
        "amqp-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-transport" or (buildDepError "network-transport"))
            (hsPkgs."network-transport-amqp" or (buildDepError "network-transport-amqp"))
            (hsPkgs."amqp" or (buildDepError "amqp"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."network-transport-tests" or (buildDepError "network-transport-tests"))
            ];
          buildable = true;
          };
        "api-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-transport" or (buildDepError "network-transport"))
            (hsPkgs."network-transport-amqp" or (buildDepError "network-transport-amqp"))
            (hsPkgs."amqp" or (buildDepError "amqp"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."network-transport-tests" or (buildDepError "network-transport-tests"))
            ];
          buildable = true;
          };
        };
      };
    }