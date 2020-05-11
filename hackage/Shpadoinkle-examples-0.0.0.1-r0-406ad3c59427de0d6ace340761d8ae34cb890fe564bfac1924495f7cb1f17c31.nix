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
      specVersion = "1.12";
      identifier = { name = "Shpadoinkle-examples"; version = "0.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "fresheyeball@protonmail.com";
      author = "Isaac Shapira";
      homepage = "";
      url = "";
      synopsis = "Example usages of Shpadoinkle";
      description = "A collection of illustrative applications to show various Shpadoinkle utilities.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "counter" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-pardiff" or (buildDepError "Shpadoinkle-backend-pardiff"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "servant-crud-client" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-pardiff" or (buildDepError "Shpadoinkle-backend-pardiff"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."Shpadoinkle-lens" or (buildDepError "Shpadoinkle-lens"))
            (hsPkgs."Shpadoinkle-router" or (buildDepError "Shpadoinkle-router"))
            (hsPkgs."Shpadoinkle-widgets" or (buildDepError "Shpadoinkle-widgets"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."beam-core" or (buildDepError "beam-core"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unliftio" or (buildDepError "unliftio"))
            ] ++ (if compiler.isGhcjs && true
            then [
              (hsPkgs."servant-client-ghcjs" or (buildDepError "servant-client-ghcjs"))
              ]
            else [
              (hsPkgs."beam-sqlite" or (buildDepError "beam-sqlite"))
              (hsPkgs."servant-client" or (buildDepError "servant-client"))
              (hsPkgs."sqlite-simple" or (buildDepError "sqlite-simple"))
              ]);
          buildable = true;
          };
        "servant-crud-server" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-static" or (buildDepError "Shpadoinkle-backend-static"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."Shpadoinkle-lens" or (buildDepError "Shpadoinkle-lens"))
            (hsPkgs."Shpadoinkle-router" or (buildDepError "Shpadoinkle-router"))
            (hsPkgs."Shpadoinkle-widgets" or (buildDepError "Shpadoinkle-widgets"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."beam-core" or (buildDepError "beam-core"))
            (hsPkgs."beam-sqlite" or (buildDepError "beam-sqlite"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."sqlite-simple" or (buildDepError "sqlite-simple"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ];
          buildable = if compiler.isGhcjs && true then false else true;
          };
        "todomvc" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-pardiff" or (buildDepError "Shpadoinkle-backend-pardiff"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "todomvcatomic" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-snabbdom" or (buildDepError "Shpadoinkle-backend-snabbdom"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "widgets" = {
          depends = [
            (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
            (hsPkgs."Shpadoinkle-backend-pardiff" or (buildDepError "Shpadoinkle-backend-pardiff"))
            (hsPkgs."Shpadoinkle-html" or (buildDepError "Shpadoinkle-html"))
            (hsPkgs."Shpadoinkle-widgets" or (buildDepError "Shpadoinkle-widgets"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }