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
      identifier = { name = "netease-fm"; version = "1.2.2"; };
      license = "BSD-3-Clause";
      copyright = "2016 foreverbell";
      maintainer = "dql.foreverbell@gmail.com";
      author = "foreverbell";
      homepage = "http://github.com/foreverbell/netease-fm#readme";
      url = "";
      synopsis = "NetEase Cloud Music FM client in Haskell.";
      description = "NetEase Cloud Music FM client.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."memory" or (buildDepError "memory"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          ];
        buildable = true;
        };
      exes = {
        "netease-fm" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."brick" or (buildDepError "brick"))
            (hsPkgs."vty" or (buildDepError "vty"))
            (hsPkgs."netease-fm" or (buildDepError "netease-fm"))
            ];
          buildable = true;
          };
        };
      };
    }