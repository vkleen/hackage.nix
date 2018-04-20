{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      bytestring-in-base = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2.1";
        identifier = {
          name = "zlib";
          version = "0.4.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2006-2008 Duncan Coutts";
        maintainer = "Duncan Coutts <duncan@haskell.org>";
        author = "Duncan Coutts <duncan@haskell.org>";
        homepage = "";
        url = "";
        synopsis = "Compression and decompression in the gzip and zlib formats";
        description = "This package provides a pure interface for compressing and\ndecompressing streams of data represented as lazy\n'ByteString's. It uses the zlib C library so it has high\nperformance. It supports the \\\"zlib\\\", \\\"gzip\\\" and \\\"raw\\\"\ncompression formats.\n\nIt provides a convenient high level api suitable for most\ntasks and for the few cases where more control is needed it\nprovides access to the full zlib feature set.";
        buildType = "Simple";
      };
      components = {
        zlib = {
          depends  = if _flags.bytestring-in-base
            then [ hsPkgs.base ]
            else [
              hsPkgs.base
              hsPkgs.bytestring
            ];
          libs = pkgs.lib.optional (!system.isWindows) pkgs.z;
        };
      };
    }