{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "gsasl";
          version = "0.2";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "jmillikin@gmail.com";
        author = "John Millikin";
        homepage = "";
        url = "";
        synopsis = "Bindings for GNU SASL";
        description = "";
        buildType = "Simple";
      };
      components = {
        gsasl = {
          depends  = [ hsPkgs.base ];
          libs = [ pkgs.gsasl ];
          pkgconfig = [
            pkgconfPkgs.libgsasl
          ];
        };
      };
    }