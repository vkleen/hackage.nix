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
      specVersion = "1.8";
      identifier = { name = "courier"; version = "0.1.0.3"; };
      license = "MIT";
      copyright = "Copyright (c) 2013 Phil Hargett";
      maintainer = "phil@haphazardhouse.net";
      author = "Phil Hargett";
      homepage = "http://github.com/hargettp/courier";
      url = "";
      synopsis = "A message-passing library, intended for simplifying network applications";
      description = "Inspired by Erlang's simple message-passing facilities, courier provides roughly similar\ncapabilities. Applications simply create one or more 'Network.Endpoints.Endpoint's,\nbind each to a 'Network.Transport.Transport' using a given name, then can freely\nsend / receive messages to other endpoints just by referencing the name each endpoint\nbound to its transport.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."network-simple" or (buildDepError "network-simple"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      tests = {
        "test-courier" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."courier" or (buildDepError "courier"))
            ];
          buildable = true;
          };
        };
      };
    }