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
      identifier = { name = "ampersand"; version = "3.1.0"; };
      license = "LicenseRef-GPL";
      copyright = "Stef Joosten";
      maintainer = "stef.joosten@ou.nl";
      author = "Stef Joosten";
      homepage = "http://wiki.tarski.nl";
      url = "";
      synopsis = "Toolsuite for automated design of business processes.";
      description = "You can define your business processes by means of rules, written in Relation Algebra.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "ampersand" = {
          depends = [
            (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
            (hsPkgs."SpreadsheetML" or (buildDepError "SpreadsheetML"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."csv" or (buildDepError "csv"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."graphviz" or (buildDepError "graphviz"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."simple-sql-parser" or (buildDepError "simple-sql-parser"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."xlsx" or (buildDepError "xlsx"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."wl-pprint" or (buildDepError "wl-pprint"))
            ];
          buildable = true;
          };
        };
      tests = {
        "ampersand-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."simple-sql-parser" or (buildDepError "simple-sql-parser"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."wl-pprint" or (buildDepError "wl-pprint"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."xlsx" or (buildDepError "xlsx"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."lens" or (buildDepError "lens"))
            ];
          buildable = true;
          };
        };
      };
    }