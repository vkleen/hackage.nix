{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      developer = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "attoparsec";
          version = "0.13.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Bryan O'Sullivan <bos@serpentine.com>";
        author = "Bryan O'Sullivan <bos@serpentine.com>";
        homepage = "https://github.com/bos/attoparsec";
        url = "";
        synopsis = "Fast combinator parsing for bytestrings and text";
        description = "A fast parser combinator library, aimed particularly at dealing\nefficiently with network protocols and complicated text/binary\nfile formats.";
        buildType = "Simple";
      };
      components = {
        attoparsec = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.scientific
            hsPkgs.transformers
            hsPkgs.text
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.bytestring;
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.array
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.deepseq
              hsPkgs.QuickCheck
              hsPkgs.quickcheck-unicode
              hsPkgs.scientific
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.vector
            ];
          };
        };
        benchmarks = {
          benchmarks = {
            depends  = [
              hsPkgs.array
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.case-insensitive
              hsPkgs.containers
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.ghc-prim
              hsPkgs.http-types
              hsPkgs.parsec
              hsPkgs.scientific
              hsPkgs.text
              hsPkgs.unordered-containers
              hsPkgs.vector
            ];
          };
        };
      };
    }