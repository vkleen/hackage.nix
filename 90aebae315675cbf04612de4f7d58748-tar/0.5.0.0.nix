{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      old-time = false;
      old-bytestring = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "tar";
          version = "0.5.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2007 Bjorn Bringert <bjorn@bringert.net>\n2008-2016 Duncan Coutts <duncan@community.haskell.org>";
        maintainer = "Duncan Coutts <duncan@community.haskell.org>";
        author = "Duncan Coutts <duncan@community.haskell.org>\nBjorn Bringert <bjorn@bringert.net>";
        homepage = "";
        url = "";
        synopsis = "Reading, writing and manipulating \".tar\" archive files.";
        description = "This library is for working with \\\"@.tar@\\\" archive files. It\ncan read and write a range of common variations of archive\nformat including V7, POSIX USTAR and GNU formats.\n\nIt provides support for packing and unpacking portable\narchives. This makes it suitable for distribution but not\nbackup because details like file ownership and exact\npermissions are not preserved.\n\nIt also provides features for random access to archive\ncontent using an index.";
        buildType = "Simple";
      };
      components = {
        tar = {
          depends  = ([
            hsPkgs.base
            hsPkgs.filepath
            hsPkgs.directory
            hsPkgs.array
            hsPkgs.containers
            hsPkgs.deepseq
          ] ++ (if _flags.old-time
            then [
              hsPkgs.directory
              hsPkgs.old-time
            ]
            else [
              hsPkgs.directory
              hsPkgs.time
            ])) ++ (if _flags.old-bytestring
            then [
              hsPkgs.bytestring-builder
              hsPkgs.bytestring
            ]
            else [ hsPkgs.bytestring ]);
        };
        tests = {
          properties = {
            depends  = ([
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.array
              hsPkgs.containers
              hsPkgs.deepseq
              hsPkgs.bytestring-handle
              hsPkgs.QuickCheck
              hsPkgs.tasty
              hsPkgs.tasty-quickcheck
            ] ++ (if _flags.old-time
              then [
                hsPkgs.directory
                hsPkgs.old-time
              ]
              else [
                hsPkgs.directory
                hsPkgs.time
              ])) ++ (if _flags.old-bytestring
              then [
                hsPkgs.bytestring-builder
                hsPkgs.bytestring
              ]
              else [ hsPkgs.bytestring ]);
          };
        };
        benchmarks = {
          bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.array
              hsPkgs.containers
              hsPkgs.deepseq
              hsPkgs.old-time
              hsPkgs.time
              hsPkgs.criterion
            ];
          };
        };
      };
    }