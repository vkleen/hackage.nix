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
      specVersion = "1.16";
      identifier = { name = "claferwiki"; version = "0.3.5"; };
      license = "MIT";
      copyright = "Michal Antkiewicz, Chris Walker, Luke Michael Brown";
      maintainer = "mantkiew@gsd.uwaterloo.ca";
      author = "Michal Antkiewicz, Chris Walker, Luke Michael Brown";
      homepage = "http://github.com/gsdlab/claferwiki";
      url = "";
      synopsis = "A wiki-based IDE for literate modeling with Clafer";
      description = "A wiki-based IDE for literate modeling with Clafer. A Plugin for the Gitit wiki which collects code blocks written in Clafer (.clafer), compiles them, renders into HTML and Dot, and replaces the code blocks with the results.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."gitit" or (buildDepError "gitit"))
          (hsPkgs."clafer" or (buildDepError "clafer"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.ghc or (pkgs.buildPackages.ghc or (buildToolDepError "ghc")))
          ];
        buildable = true;
        };
      };
    }