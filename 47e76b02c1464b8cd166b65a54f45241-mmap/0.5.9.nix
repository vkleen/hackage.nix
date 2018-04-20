{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      mmaptest = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "mmap";
          version = "0.5.9";
        };
        license = "BSD-3-Clause";
        copyright = "2008-2012, Gracjan Polak";
        maintainer = "Gracjan Polak <gracjanpolak@gmail.com>";
        author = "Gracjan Polak <gracjanpolak@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "Memory mapped files for POSIX and Windows";
        description = "This library provides a wrapper to mmap(2) or MapViewOfFile,\nallowing files or devices to be lazily loaded into memory as\nstrict or lazy ByteStrings, ForeignPtrs or plain Ptrs, using\nthe virtual memory subsystem to do on-demand loading.\nModifications are also supported.";
        buildType = "Simple";
      };
      components = {
        mmap = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ];
        };
        exes = {
          mmaptest = {
            depends  = pkgs.lib.optionals _flags.mmaptest [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.HUnit
              hsPkgs.directory
            ] ++ pkgs.lib.optional system.isWindows hsPkgs.Win32;
          };
        };
      };
    }