{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hxthelper";
          version = "0.2.2";
        };
        license = "LicenseRef-LGPL";
        copyright = "";
        maintainer = "David Leuschner <leuschner@openfactis.org>";
        author = "David Leuschner, Stefan Wehr";
        homepage = "";
        url = "";
        synopsis = "Helper functions for HXT";
        description = "Helper functions for HXT including pure parsing and serialization\nfunctions, easier pickling of sum-types, ensuring all XML content\nis parsed during unpickling.";
        buildType = "Custom";
      };
      components = {
        hxthelper = {
          depends  = [
            hsPkgs.base
            hsPkgs.hxt
            hsPkgs.bytestring
            hsPkgs.mtl
            hsPkgs.encoding
          ];
        };
      };
    }