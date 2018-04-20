{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "attoparsec-conduit";
          version = "0.5.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "michael@snoyman.com";
        author = "Michael Snoyman";
        homepage = "http://github.com/snoyberg/conduit";
        url = "";
        synopsis = "Consume attoparsec parsers via conduit.";
        description = "Consume attoparsec parsers via conduit.";
        buildType = "Simple";
      };
      components = {
        attoparsec-conduit = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.bytestring
            hsPkgs.attoparsec
            hsPkgs.text
            hsPkgs.conduit
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.conduit
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.HUnit
              hsPkgs.text
              hsPkgs.resourcet
              hsPkgs.attoparsec
              hsPkgs.attoparsec-conduit
              hsPkgs.conduit
            ];
          };
        };
      };
    }