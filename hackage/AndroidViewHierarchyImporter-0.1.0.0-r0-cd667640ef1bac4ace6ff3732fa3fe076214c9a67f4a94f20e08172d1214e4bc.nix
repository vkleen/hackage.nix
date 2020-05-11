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
      specVersion = "1.8";
      identifier = {
        name = "AndroidViewHierarchyImporter";
        version = "0.1.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "2012, alpheccar";
      maintainer = "misc@alpheccar.org";
      author = "alpheccar";
      homepage = "";
      url = "";
      synopsis = "Tool to import a description of an Android view hierarchy through Abd and the Android view server";
      description = "Tool to import a description of an Android view hierarchy through Abd and the Android view server.\nYou can find more documentation in the @Main@ file.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "AndroidViewHierarchyImporter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."opml" or (buildDepError "opml"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."cmdtheline" or (buildDepError "cmdtheline"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            ];
          buildable = true;
          };
        };
      };
    }