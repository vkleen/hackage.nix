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
      specVersion = "1.2";
      identifier = { name = "yst"; version = "0.2.4"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "http://github.com/jgm/yst";
      url = "";
      synopsis = "Builds a static website from templates and data in YAML or\nCSV files.";
      description = "`yst` is a tool for generating a static website\nby filling string templates with data taken from\nYAML text files (or, alternatively, CSV files).\nThis approach combines the speed, security, and\nease of deployment of a static website with the\nflexibility and maintainability of a dynamic site\nthat separates presentation and data.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "yst" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
            (hsPkgs."HsSyck" or (buildDepError "HsSyck"))
            (hsPkgs."csv" or (buildDepError "csv"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."split" or (buildDepError "split"))
            ];
          buildable = true;
          };
        };
      };
    }