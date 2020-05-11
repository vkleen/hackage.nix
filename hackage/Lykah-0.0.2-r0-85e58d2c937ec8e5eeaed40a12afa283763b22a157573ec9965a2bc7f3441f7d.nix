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
      identifier = { name = "Lykah"; version = "0.0.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "Johannes Gerer <oss@johannesgerer.com>";
      author = "Johannes Gerer";
      homepage = "http://johannesgerer.com/buchhaltung";
      url = "";
      synopsis = "A static website and blog generator";
      description = "Build websites using the full power and flexibility of Haskell.\n\nSee <https://github.com/johannesgerer/Lykah Readme> on Github.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."ListLike" or (buildDepError "ListLike"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."clay" or (buildDepError "clay"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."blazeT" or (buildDepError "blazeT"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filesystem-trees" or (buildDepError "filesystem-trees"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          ];
        buildable = true;
        };
      exes = {
        "lykah" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."ListLike" or (buildDepError "ListLike"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."clay" or (buildDepError "clay"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."blazeT" or (buildDepError "blazeT"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filesystem-trees" or (buildDepError "filesystem-trees"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            ];
          buildable = true;
          };
        };
      };
    }