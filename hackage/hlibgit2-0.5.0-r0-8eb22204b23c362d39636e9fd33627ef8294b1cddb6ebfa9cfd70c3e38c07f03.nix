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
      identifier = { name = "hlibgit2"; version = "0.5.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "johnw@newartisans.com";
      author = "Sakari Jokinen, Jacob Stanley, John Wiegley";
      homepage = "";
      url = "";
      synopsis = "Low-level bindings to libgit2.";
      description = "Bindings to libgit2 v0.16.0-471-g5b9fac3";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."lens" or (buildDepError "lens"))
          ];
        libs = [ (pkgs."git2" or (sysDepError "git2")) ];
        buildable = true;
        };
      tests = {
        "smoke" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hlibgit2" or (buildDepError "hlibgit2"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."lens" or (buildDepError "lens"))
            ];
          buildable = true;
          };
        };
      };
    }