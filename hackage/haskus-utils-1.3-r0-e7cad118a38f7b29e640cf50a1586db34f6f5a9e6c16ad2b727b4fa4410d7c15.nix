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
      specVersion = "1.21";
      identifier = { name = "haskus-utils"; version = "1.3"; };
      license = "BSD-3-Clause";
      copyright = "Sylvain Henry 2018";
      maintainer = "sylvain@haskus.fr";
      author = "Sylvain Henry";
      homepage = "http://docs.haskus.org/";
      url = "";
      synopsis = "Haskus utility modules";
      description = "Haskus utility modules.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskus-utils-types" or (buildDepError "haskus-utils-types"))
          (hsPkgs."haskus-utils-data" or (buildDepError "haskus-utils-data"))
          (hsPkgs."haskus-utils-variant" or (buildDepError "haskus-utils-variant"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."recursion-schemes" or (buildDepError "recursion-schemes"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskus-utils" or (buildDepError "haskus-utils"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        };
      };
    }