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
      identifier = { name = "dixi"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Liam O'Connor, 2015";
      maintainer = "liamoc@cse.unsw.edu.au";
      author = "Liam O'Connor";
      homepage = "https://github.com/liamoc/dixi";
      url = "";
      synopsis = "A wiki implemented with a firm theoretical foundation.";
      description = "This project is a simple wiki developed based on a\nfirm theoretical foundation.\n\nDocuments are not stored directly, but as a composition\ntree of patches to an initial empty document. As our\npatches support operational transform, edits can be\nmade to any version of each document and they are\ntransformed to be applied to the latest version.\n\nThis also makes it easy to use the group structure of\npatches to be able to revert changes (or the composition\nof several changes) from deep in a document's history and\npreserve every other change.\n\nRight now the wiki doesn't support many bells and whistles,\nsuch as administrator control, configurability, or user accounts,\nbut they're coming.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "dixi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."composition-tree" or (buildDepError "composition-tree"))
            (hsPkgs."patches-vector" or (buildDepError "patches-vector"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."acid-state" or (buildDepError "acid-state"))
            (hsPkgs."safecopy" or (buildDepError "safecopy"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."servant-blaze" or (buildDepError "servant-blaze"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }