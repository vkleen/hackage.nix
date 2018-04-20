{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "repa-scalar";
          version = "4.2.3.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Ben Lippmeier <benl@ouroborus.net>";
        author = "The Repa Development Team";
        homepage = "http://repa.ouroborus.net";
        url = "";
        synopsis = "Scalar data types and conversions.";
        description = "Scalar data types and conversions.";
        buildType = "Simple";
      };
      components = {
        repa-scalar = {
          depends  = [
            hsPkgs.base
            hsPkgs.primitive
            hsPkgs.vector
            hsPkgs.bytestring
            hsPkgs.double-conversion
            hsPkgs.time
          ];
        };
      };
    }