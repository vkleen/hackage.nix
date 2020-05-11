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
      identifier = { name = "leksah"; version = "0.1"; };
      license = "LicenseRef-GPL";
      copyright = "2007 Juergen Nicklisch-Franken";
      maintainer = "Juergen Nicklisch-Franken";
      author = "Jutaro (Juergen Nicklisch-Franken)";
      homepage = "";
      url = "http://code.haskell.org/leksah";
      synopsis = "Genuine Haskell Face";
      description = "An Integrated Development Environment for Haskell written in Haskell.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "leksah" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."glib" or (buildDepError "glib"))
            (hsPkgs."sourceview" or (buildDepError "sourceview"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }