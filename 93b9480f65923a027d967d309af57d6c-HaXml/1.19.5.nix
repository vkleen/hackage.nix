{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
      bytestringinbase = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "HaXml";
          version = "1.19.5";
        };
        license = "LicenseRef-LGPL";
        copyright = "";
        maintainer = "author";
        author = "Malcolm Wallace <Malcolm.Wallace@cs.york.ac.uk>";
        homepage = "http://www.cs.york.ac.uk/fp/HaXml/";
        url = "";
        synopsis = "Utilities for manipulating XML documents";
        description = "Haskell utilities for parsing, filtering, transforming and\ngenerating XML documents.";
        buildType = "Simple";
      };
      components = {
        HaXml = {
          depends  = ([
            hsPkgs.base
            hsPkgs.haskell98
            hsPkgs.polyparse
            hsPkgs.filepath
          ] ++ (if _flags.splitbase
            then [
              hsPkgs.base
              hsPkgs.pretty
              hsPkgs.random
              hsPkgs.containers
            ]
            else [
              hsPkgs.base
            ])) ++ (if _flags.bytestringinbase
            then [ hsPkgs.base ]
            else [
              hsPkgs.base
              hsPkgs.bytestring
            ]);
        };
        exes = {
          Canonicalise = {};
          CanonicaliseLazy = {};
          Xtract = {};
          XtractLazy = {};
          Validate = {};
          MkOneOf = {};
          DtdToHaskell = {};
        };
      };
    }