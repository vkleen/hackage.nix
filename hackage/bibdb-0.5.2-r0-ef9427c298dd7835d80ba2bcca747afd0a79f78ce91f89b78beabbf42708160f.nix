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
      identifier = { name = "bibdb"; version = "0.5.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "coskuacay@gmail.con";
      author = "Josh Acay";
      homepage = "https://github.com/cacay/bibdb";
      url = "";
      synopsis = "A database based bibliography manager for BibTeX";
      description = "bibdb is a simple citation resolver and bibliography manager for BibTeX.\nInstead of manually copy pasting bibliographies, you specify a reference\nto the work you want to cite (by providing a DOI or a DBLP key, for example)\nin a simple domain specific language. bibdb is then responsible for fetching\nthe citations, renaming them, removing duplicates, and sorting them properly.\nFor more information, see the <https://github.com/cacay/bibdb>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "bibdb" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."microlens" or (buildDepError "microlens"))
            (hsPkgs."microlens-mtl" or (buildDepError "microlens-mtl"))
            (hsPkgs."microlens-th" or (buildDepError "microlens-th"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."bibtex" or (buildDepError "bibtex"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."curl" or (buildDepError "curl"))
            (hsPkgs."download-curl" or (buildDepError "download-curl"))
            (hsPkgs."async" or (buildDepError "async"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.alex or (pkgs.buildPackages.alex or (buildToolDepError "alex")))
            (hsPkgs.buildPackages.happy or (pkgs.buildPackages.happy or (buildToolDepError "happy")))
            ];
          buildable = true;
          };
        };
      };
    }