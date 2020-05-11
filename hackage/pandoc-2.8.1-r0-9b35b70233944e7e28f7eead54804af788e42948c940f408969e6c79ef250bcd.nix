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
    flags = { static = false; embed_data_files = false; trypandoc = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "pandoc"; version = "2.8.1"; };
      license = "GPL-2.0-only";
      copyright = "(c) 2006-2019 John MacFarlane";
      maintainer = "John MacFarlane <jgm@berkeley.edu>";
      author = "John MacFarlane <jgm@berkeley.edu>";
      homepage = "https://pandoc.org";
      url = "";
      synopsis = "Conversion between markup formats";
      description = "Pandoc is a Haskell library for converting from one markup\nformat to another, and a command-line tool that uses\nthis library. It can read several dialects of Markdown and\n(subsets of) HTML, reStructuredText, LaTeX, DocBook, JATS,\nMediaWiki markup, DokuWiki markup, TWiki markup,\nTikiWiki markup, Creole 1.0, Haddock markup, OPML,\nEmacs Org-Mode, Emacs Muse, txt2tags, ipynb (Jupyter\nnotebooks), Vimwiki, Word Docx, ODT, EPUB, FictionBook2,\nroff man, and Textile, and it can write Markdown,\nreStructuredText, XHTML, HTML 5, LaTeX, ConTeXt, DocBook,\nJATS, OPML, TEI, OpenDocument, ODT, Word docx,\nPowerPoint pptx, RTF, MediaWiki, DokuWiki, XWiki,\nZimWiki, Textile, Jira, roff man, roff ms, plain text,\nEmacs Org-Mode, AsciiDoc, Haddock markup,\nEPUB (v2 and v3), ipynb, FictionBook2,\nInDesign ICML, Muse, LaTeX beamer slides,\nand several kinds of HTML/JavaScript slide shows\n(S5, Slidy, Slideous, DZSlides, reveal.js).\n\nIn contrast to most existing tools for converting Markdown\nto HTML, pandoc has a modular design: it consists of a set of\nreaders, which parse text in a given format and produce a\nnative representation of the document, and a set of writers,\nwhich convert this native representation into a target\nformat. Thus, adding an input or output format requires\nonly adding a reader or writer.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."zip-archive" or (buildDepError "zip-archive"))
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."texmath" or (buildDepError "texmath"))
          (hsPkgs."xml" or (buildDepError "xml"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."skylighting" or (buildDepError "skylighting"))
          (hsPkgs."skylighting-core" or (buildDepError "skylighting-core"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."hslua" or (buildDepError "hslua"))
          (hsPkgs."hslua-module-system" or (buildDepError "hslua-module-system"))
          (hsPkgs."hslua-module-text" or (buildDepError "hslua-module-text"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          (hsPkgs."haddock-library" or (buildDepError "haddock-library"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
          (hsPkgs."Glob" or (buildDepError "Glob"))
          (hsPkgs."cmark-gfm" or (buildDepError "cmark-gfm"))
          (hsPkgs."doctemplates" or (buildDepError "doctemplates"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."unicode-transforms" or (buildDepError "unicode-transforms"))
          (hsPkgs."HsYAML" or (buildDepError "HsYAML"))
          (hsPkgs."doclayout" or (buildDepError "doclayout"))
          (hsPkgs."ipynb" or (buildDepError "ipynb"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."text-conversions" or (buildDepError "text-conversions"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ] ++ (pkgs.lib).optionals (system.isWindows && system.isI386) [
          (hsPkgs."basement" or (buildDepError "basement"))
          (hsPkgs."foundation" or (buildDepError "foundation"))
          ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"))) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"))) ++ (pkgs.lib).optional (flags.embed_data_files) (hsPkgs."file-embed" or (buildDepError "file-embed"));
        buildable = true;
        };
      exes = {
        "pandoc" = {
          depends = [
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."base" or (buildDepError "base"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"));
          buildable = true;
          };
        "trypandoc" = {
          depends = (pkgs.lib).optionals (flags.trypandoc) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"));
          buildable = if flags.trypandoc then true else false;
          };
        };
      tests = {
        "test-pandoc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hslua" or (buildDepError "hslua"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."Diff" or (buildDepError "Diff"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-lua" or (buildDepError "tasty-lua"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."executable-path" or (buildDepError "executable-path"))
            (hsPkgs."zip-archive" or (buildDepError "zip-archive"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."doctemplates" or (buildDepError "doctemplates"))
            (hsPkgs."Glob" or (buildDepError "Glob"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"));
          buildable = true;
          };
        };
      benchmarks = {
        "weigh-pandoc" = {
          depends = [
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."weigh" or (buildDepError "weigh"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"));
          buildable = true;
          };
        "benchmark-pandoc" = {
          depends = [
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.4") (hsPkgs."base-compat" or (buildDepError "base-compat"));
          buildable = true;
          };
        };
      };
    }