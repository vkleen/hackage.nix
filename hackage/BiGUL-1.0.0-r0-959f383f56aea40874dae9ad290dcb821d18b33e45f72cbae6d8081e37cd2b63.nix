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
      specVersion = "1.22";
      identifier = { name = "BiGUL"; version = "1.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "Josh Ko <hsiang-shang@nii.ac.jp> and Zirun Zhu <zhu@nii.ac.jp>";
      author = "Josh Ko, Tao Zan, Li Liu, Zirun Zhu, Jorge Mendes, and Zhenjiang Hu";
      homepage = "http://www.prg.nii.ac.jp/project/bigul/";
      url = "";
      synopsis = "The Bidirectional Generic Update Language";
      description = "Putback-based bidirectional programming allows the programmer to\nwrite only one putback transformation, from which the unique\ncorresponding forward transformation is derived for free. BiGUL,\nshort for the Bidirectional Generic Update Language, is designed to\nbe a minimalist putback-based bidirectional programming language.\nBiGUL was originally developed in the dependently typed programming\nlanguage Agda, and its well-behavedness has been completely formally\nverified; this package is the Haskell port of BiGUL.\n\nFor more detail, see the following paper:\n\n* Hsiang-Shang Ko, Tao Zan, and Zhenjiang Hu. BiGUL: A formally\nverified core language for putback-based bidirectional programming.\nIn /Partial Evaluation and Program Manipulation/, PEPM’16,\npages 61–72. ACM, 2016. <http://dx.doi.org/10.1145/2847538.2847544>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."th-extras" or (buildDepError "th-extras"))
          ];
        buildable = true;
        };
      };
    }