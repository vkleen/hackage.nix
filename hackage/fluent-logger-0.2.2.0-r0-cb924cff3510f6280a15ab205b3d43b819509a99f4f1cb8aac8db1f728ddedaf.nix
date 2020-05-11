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
      identifier = { name = "fluent-logger"; version = "0.2.2.0"; };
      license = "Apache-2.0";
      copyright = "Copyright (c) 2012, Noriyuki OHKAWA";
      maintainer = "Noriyuki OHKAWA <n.ohkawa@gmail.com>";
      author = "Noriyuki OHKAWA <n.ohkawa@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "A structured logger for Fluentd (Haskell)";
      description = "A structured logger for Fluentd (Haskell) <http://fluentd.org/>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."network-socket-options" or (buildDepError "network-socket-options"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."messagepack" or (buildDepError "messagepack"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      tests = {
        "fluent-logger-spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fluent-logger" or (buildDepError "fluent-logger"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."messagepack" or (buildDepError "messagepack"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."cereal-conduit" or (buildDepError "cereal-conduit"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "fluent-logger-benchmark" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fluent-logger" or (buildDepError "fluent-logger"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }