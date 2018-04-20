{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      development = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "binary";
          version = "0.7.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Lennart Kolmodin, Don Stewart <dons00@gmail.com>";
        author = "Lennart Kolmodin <kolmodin@gmail.com>";
        homepage = "https://github.com/kolmodin/binary";
        url = "";
        synopsis = "Binary serialisation for Haskell values using lazy ByteStrings";
        description = "Efficient, pure binary serialisation using lazy ByteStrings.\nHaskell values may be encoded to and from binary formats,\nwritten to disk as binary, or sent over the network.\nThe format used can be automatically generated, or\nyou can choose to implement a custom format if needed.\nSerialisation speeds of over 1 G\\/sec have been observed,\nso this library should be suitable for high performance\nscenarios.";
        buildType = "Simple";
      };
      components = {
        binary = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.array
          ] ++ pkgs.lib.optional (compiler.isGhc && compiler.isGhc) hsPkgs.ghc-prim;
        };
        tests = {
          qc = {
            depends  = [
              hsPkgs.array
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.random
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
              hsPkgs.QuickCheck
            ];
          };
          read-write-file = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.binary
              hsPkgs.Cabal
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.HUnit
            ];
          };
        };
        benchmarks = {
          bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
            ];
          };
          get = {
            depends  = [
              hsPkgs.attoparsec
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.cereal
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.mtl
            ];
          };
          builder = {
            depends  = [
              hsPkgs.base
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.mtl
            ];
          };
        };
      };
    }