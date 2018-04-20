{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      development = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.12";
        identifier = {
          name = "olwrapper";
          version = "0.3.7.15";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "tomnobleman@gmail.com";
        author = "Thomas Edelmann";
        homepage = "";
        url = "";
        synopsis = "An OpenLayers JavaScript Wrapper and Webframework with snaplet-fay";
        description = "Haskell OpenLayers Wrapper\n\n* the project has development status\n\n* the library is also the tutorial\n\n* for a full documentation please read my diploma thesis 2015 (TU Vienna) - fully available in summer 2015";
        buildType = "Simple";
      };
      components = {
        olwrapper = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.lens
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.fay
            hsPkgs.fay-text
            hsPkgs.fay-jquery
            hsPkgs.snap
            hsPkgs.snap-core
            hsPkgs.snap-server
            hsPkgs.snaplet-fay
            hsPkgs.snap-loader-static
            hsPkgs.snap-loader-dynamic
          ];
        };
        exes = {
          olwrapper = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.lens
              hsPkgs.mtl
              hsPkgs.text
              hsPkgs.fay
              hsPkgs.fay-text
              hsPkgs.fay-jquery
              hsPkgs.snap
              hsPkgs.snap-core
              hsPkgs.snap-server
              hsPkgs.snaplet-fay
              hsPkgs.snap-loader-static
            ] ++ pkgs.lib.optional _flags.development hsPkgs.snap-loader-dynamic;
          };
        };
      };
    }