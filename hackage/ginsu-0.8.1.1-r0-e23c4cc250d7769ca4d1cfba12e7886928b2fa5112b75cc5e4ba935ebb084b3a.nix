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
      specVersion = "1.6";
      identifier = { name = "ginsu"; version = "0.8.1.1"; };
      license = "MIT";
      copyright = "2002-2009 John Meacham <john@repetae.net>\n2011-2012 Dylan Simon <dylan@dylex.net>";
      maintainer = "dylan@dylex.net";
      author = "John Meacham <john@foo.net>\nDylan Simon <dylan@dylex.net>";
      homepage = "http://repetae.net/computer/ginsu/";
      url = "";
      synopsis = "Ginsu Gale Client";
      description = "Ginsu is a client for the gale chat system. It is designed to be powerful and above all stable, as well as having a quick learning curve.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "ginsu" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."hashtables" or (buildDepError "hashtables"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            ];
          libs = [
            (pkgs."ssl" or (sysDepError "ssl"))
            (pkgs."crypto" or (sysDepError "crypto"))
            ];
          buildable = true;
          };
        };
      };
    }