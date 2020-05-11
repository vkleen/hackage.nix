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
      identifier = { name = "mediawiki2latex"; version = "7.9"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Dirk Hünniger <dirk.hunniger@googlemail.com>";
      author = "Dirk Hünniger <dirk.hunniger@googlemail.com>";
      homepage = "http://sourceforge.net/projects/wb2pdf/";
      url = "";
      synopsis = "Convert MediaWiki text to LaTeX";
      description = "Wb2pdf converts MediaWiki markup to LaTeX and PDF.\nSo it provides and export from MediaWiki to LaTeX.\nIt works with any project running MediaWiki, especially Wikipedia and Wikibooks.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "mediawiki2latex" = {
          depends = [
            (hsPkgs."directory-tree" or (buildDepError "directory-tree"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."url" or (buildDepError "url"))
            (hsPkgs."hxt-http" or (buildDepError "hxt-http"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."highlighting-kate" or (buildDepError "highlighting-kate"))
            (hsPkgs."utility-ht" or (buildDepError "utility-ht"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."happstack-server" or (buildDepError "happstack-server"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            ];
          buildable = true;
          };
        };
      };
    }