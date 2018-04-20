{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.9";
        identifier = {
          name = "Elm";
          version = "0.11";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2011-2013 Evan Czaplicki";
        maintainer = "info@elm-lang.org";
        author = "Evan Czaplicki";
        homepage = "http://elm-lang.org";
        url = "";
        synopsis = "The Elm language module.";
        description = "Elm aims to make client-side web-development more pleasant.\nIt is a statically/strongly typed, functional reactive\nlanguage to HTML, CSS, and JS. This package provides a\nlibrary for Elm compilation in Haskell and a compiler\nexecutable.";
        buildType = "Simple";
      };
      components = {
        Elm = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.blaze-html
            hsPkgs.blaze-markup
            hsPkgs.bytestring
            hsPkgs.cmdargs
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.indents
            hsPkgs.language-ecmascript
            hsPkgs.mtl
            hsPkgs.pandoc
            hsPkgs.parsec
            hsPkgs.pretty
            hsPkgs.text
            hsPkgs.transformers
            hsPkgs.union-find
            hsPkgs.unordered-containers
          ];
        };
        exes = {
          elm = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.blaze-html
              hsPkgs.blaze-markup
              hsPkgs.bytestring
              hsPkgs.cmdargs
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.indents
              hsPkgs.language-ecmascript
              hsPkgs.mtl
              hsPkgs.pandoc
              hsPkgs.parsec
              hsPkgs.pretty
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.union-find
              hsPkgs.unordered-containers
            ];
          };
          elm-doc = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.cmdargs
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.indents
              hsPkgs.mtl
              hsPkgs.pandoc
              hsPkgs.parsec
              hsPkgs.pretty
              hsPkgs.text
              hsPkgs.union-find
            ];
          };
        };
        tests = {
          test-elm = {
            depends  = [
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.Elm
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
              hsPkgs.HUnit
              hsPkgs.pretty
              hsPkgs.QuickCheck
              hsPkgs.filemanip
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.blaze-html
              hsPkgs.blaze-markup
              hsPkgs.bytestring
              hsPkgs.cmdargs
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.indents
              hsPkgs.language-ecmascript
              hsPkgs.mtl
              hsPkgs.pandoc
              hsPkgs.parsec
              hsPkgs.pretty
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.union-find
              hsPkgs.unordered-containers
            ];
          };
        };
      };
    }