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
      identifier = { name = "HaTeX"; version = "3.17.3.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Daniel Díaz (dhelta `dot` diaz `at` gmail `dot` com)";
      author = "Daniel Díaz";
      homepage = "https://github.com/Daniel-Diaz/HaTeX/blob/master/README.md";
      url = "";
      synopsis = "The Haskell LaTeX library.";
      description = "This library implements the LaTeX syntax and provides some useful abstractions.\n\nSome of the things you can do with HaTeX are:\n\n* Write LaTeX documents with all the advantages you already have in Haskell: recursion,\ntype system, high order functions, ...\n\n* Create a LaTeX backend for your own program.\n\n* Parse a LaTeX file and obtain its Abstract Syntax Tree (AST).\n\n* Pretty-print Haskell values in LaTeX.\n\n* Generate TikZ scripts (images!) easily.\n\nBrowse the @examples@ directory in the source distribution to see some simple examples.\nIt might help you to get started. The HaTeX User's Guide is available at\n<https://github.com/Daniel-Diaz/hatex-guide/blob/master/README.md>.\nWe also have a mailing list (<http://projects.haskell.org/cgi-bin/mailman/listinfo/hatex>)\nand an IRC channel (@#hatex@). If you just want to read a short introduction, read\nthe \"Text.LaTeX\" module.\n\nIf you prefer to write in LaTeX and all you want is to /program/ some parts of the document,\nor if you already have the LaTeX document written and you just want to add some automatically\ngenerated LaTeX code somewhere, check haskintex: <http://daniel-diaz.github.io/projects/haskintex>.\nIt allows you to embed Haskell in LaTeX. It also makes you easy to use HaTeX within a LaTeX document.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."matrix" or (buildDepError "matrix"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."wl-pprint-extras" or (buildDepError "wl-pprint-extras"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      tests = {
        "hatex-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HaTeX" or (buildDepError "HaTeX"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        "parser-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HaTeX" or (buildDepError "HaTeX"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }