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
    flags = { threaded = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "hyakko"; version = "0.2.1"; };
      license = "MIT";
      copyright = "(c) 2011 Jeremy Hull";
      maintainer = "Jeremy Hull <sourdrums@gmail.com>";
      author = "Jeremy Hull <sourdrums@gmail.com>";
      homepage = "http://sourrust.github.com/hyakko/";
      url = "";
      synopsis = "Literate-style Documentation Generator";
      description = "Hyakko is a Haskell port of Docco: the original quick-and-dirty,\nhundred-line-long, literate-programming-style documentation\ngenerator.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hyakko" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."regex-pcre" or (buildDepError "regex-pcre"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            ];
          buildable = true;
          };
        };
      };
    }