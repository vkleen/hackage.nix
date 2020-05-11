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
    flags = { base2 = true; buildexamples = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "bibtex"; version = "0.1.0.6"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://www.haskell.org/haskellwiki/BibTeX";
      url = "";
      synopsis = "Parse, format and processing BibTeX files";
      description = "This package allows parsing, formatting and processing of BibTeX files.\nBibTeX files are databases for literature for the natbib package\nof the LaTeX typesetting system.\n\nThe package contains two examples:\n\n* The first example demonstrates the BibTeX parser\nby generating a publication overview from a @.bib@ file.\n\n* The second example demonstrates the BibTeX generation\nby producing a large @.bib@ file from the tar archive\nthat cabal-install downloads to your local cabal directory.\n\nBoth examples will be build as stand-alone executable\nwhen running\n\n> cabal install -fbuildExamples bibtex\n\nFor the first example see the @publications@ directory of this package.\nYou can start the program and build an example document by running\n\n> make pubs\n\nTechnically the program generates a list of custom @\\\\nocite@ commands\nfor the LaTeX package @multibib@.\nYou can add the custom bibtex field @subtype@ to BibTeX entries\nfor more detailed categorization of an entry.\nSee \"publications/publications.bib\" for examples.\n\nThe second example can be executed using\n\n> make hackbib\n\nThe file @hackage.bib@ is written to the @hackage@ subdirectory.\nThe @hackage-bibtex@ program\nreads an uncompressed tar archive from standard input\nand writes the result bibliography file to standard output.\n\nNote that @hackage.bib@ exceeds some limits of standard BibTeX and LaTeX:\nThere are currently much more than 5000 versions of packages,\nthe maximum my BibTeX can handle at once.\nThat is, you can use the bibliography file,\nbut you cannot cite all entries with @\\\\nocite*@.\nIf there are more than 26 uploads by the same author in a year,\nthe BibTeX style @alpha@ generates identifiers including curly braces\nwhich interacts badly with LaTeX's handling of them.\nIf you reduce the Bibliography file to 5000 entries\nand try to generate an overview of all entries with @\\\\nocite@,\nthen @pdflatex@ hits its limits:\n\n> TeX capacity exceeded, sorry [save size=5000]";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."latex" or (buildDepError "latex"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."utility-ht" or (buildDepError "utility-ht"))
          ] ++ (if flags.base2
          then [ (hsPkgs."base" or (buildDepError "base")) ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."special-functors" or (buildDepError "special-functors"))
            ]);
        buildable = true;
        };
      exes = {
        "publication-overview" = {
          buildable = if !flags.buildexamples then false else true;
          };
        "hackage-bibtex" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        };
      };
    }