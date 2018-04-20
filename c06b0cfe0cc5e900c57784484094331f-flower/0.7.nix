{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "flower";
          version = "0.7";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "Ketil Malde <ketil@malde.org>";
        author = "Ketil Malde";
        homepage = "http://biohaskell.org/Applications/Flower";
        url = "";
        synopsis = "Analyze 454 flowgrams  (.SFF files)";
        description = "flower - FLOWgram ExtractoR tools\n\nThe flower executable reads files in SFF-format and produces various output,\nincluding sequences with quality, or flowgram data in tabular format.  By default,\nit outputs a textual representation of the data in the SFF-file, much like\n'sffinfo' from Roche does.\n\nThe fselect executable extracts reads from SFF-files, generating a new\nSFF-file with a subset of the reads based on various criteria.\n\nSometimes SFF files will appear to be corrupted, with all-zero blocks in the\nfile. The frecover program ignores these and tries to resync with the file after an\ninvalid region.  This was likely a one-time bug in the 454 software, so this program\nis probably not so useful any more.";
        buildType = "Simple";
      };
      components = {
        exes = {
          flower = {
            depends  = [
              hsPkgs.bio
              hsPkgs.base
              hsPkgs.array
              hsPkgs.bytestring
              hsPkgs.binary
              hsPkgs.random
              hsPkgs.cmdargs
              hsPkgs.containers
              hsPkgs.mtl
            ];
          };
          flowselect = {
            depends  = [
              hsPkgs.bio
              hsPkgs.random
              hsPkgs.base
            ];
          };
          frecover = {
            depends  = [
              hsPkgs.bio
              hsPkgs.base
            ];
          };
          frename = {
            depends  = [
              hsPkgs.bio
              hsPkgs.base
              hsPkgs.bytestring
            ];
          };
          flowt = {
            depends  = [
              hsPkgs.bio
              hsPkgs.base
              hsPkgs.cmdargs
              hsPkgs.containers
              hsPkgs.bytestring
            ];
          };
        };
      };
    }