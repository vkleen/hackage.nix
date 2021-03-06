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
      identifier = { name = "funcons-tools"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "Copyright (C) 2015 L. Thomas van Binsbergen and Neil Sculthorpe";
      maintainer = "L. Thomas van Binsbergen <ltvanbinsbergen@acm.org>";
      author = "L. Thomas van Binsbergen and Neil Sculthorpe";
      homepage = "http://plancomps.org";
      url = "";
      synopsis = "A modular interpreter for executing funcons";
      description = "The PLanCompS project has developed a component-based approach to formal semantics.\nThe semantics of a language is defined by translating its constructs to combinations\nof `fundamental constructs' called /funcons/.\n\nRead more about the project here: <http://plancomps.org>.\nRead more about funcons and their specification in CBS here: <http://plancomps.dreamhosters.com/wp-content/uploads/2016/02/jlamp-16.pdf JLAMP2016>.\n\nThis package provides a collection of highly reusable funcons in \"Funcons.Core\",\nan interpreter for these funcons and means for defining new funcons.\n\nThe executable provided by this package is an interpreter for running terms\nconstructed from the collection of funcons provided by \"Funcons.Core\".\nHow this executable is used is explained in \"Funcons.Tools\".\n\nAdditional funcons can be defined with the helper functions provided by\n\"Funcons.EDSL\". The module \"Funcons.Tools\" provides functions for creating\nexecutables by extending the main interpreter with additional funcons.\n\nPlease contact any of the maintainers when unexpected behaviour is encountered\nor exports appear to be missing.\n\nClick <https://hackage.haskell.org/package/funcons-tools-0.1.0.0/docs/src/funcons-tools/index.html here> for the package's documentation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."bv" or (buildDepError "bv"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."multiset" or (buildDepError "multiset"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      exes = {
        "runfct" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bv" or (buildDepError "bv"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."funcons-tools" or (buildDepError "funcons-tools"))
            (hsPkgs."multiset" or (buildDepError "multiset"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }