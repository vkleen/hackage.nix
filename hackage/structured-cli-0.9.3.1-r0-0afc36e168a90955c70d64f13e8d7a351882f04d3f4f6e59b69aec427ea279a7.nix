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
      identifier = { name = "structured-cli"; version = "0.9.3.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Erick Gonzalez";
      maintainer = "erick@codemonkeylabs.de";
      author = "Erick Gonzalez";
      homepage = "https://gitlab.com/codemonkeylabs/structured-cli#readme";
      url = "";
      synopsis = "Application library for building interactive console CLIs";
      description = "This module provides the tools to build a complete \"structured\" CLI application, similar to those found in systems like Cisco IOS or console configuration utilities etc. It aims to be easy for implementors to use.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      exes = {
        "some-cli" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."structured-cli" or (buildDepError "structured-cli"))
            ];
          buildable = true;
          };
        };
      };
    }