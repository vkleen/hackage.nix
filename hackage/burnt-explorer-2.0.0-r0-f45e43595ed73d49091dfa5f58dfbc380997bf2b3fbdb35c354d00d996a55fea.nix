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
      identifier = { name = "burnt-explorer"; version = "2.0.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "krzysztof.jurewicz@gmail.com";
      author = "Krzysztof Jurewicz";
      homepage = "https://gitlab.com/KrzysiekJ/burnt-explorer";
      url = "";
      synopsis = "List OP_RETURN cryptocurrency transaction outputs.";
      description = "This unsophisticated application prints all OP_RETURN transaction\noutputs in a given block range.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "burnt-explorer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bitcoin-script" or (buildDepError "bitcoin-script"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."cassava" or (buildDepError "cassava"))
            ];
          buildable = true;
          };
        };
      };
    }