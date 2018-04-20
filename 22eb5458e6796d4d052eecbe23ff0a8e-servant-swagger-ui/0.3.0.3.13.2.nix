{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.12";
        identifier = {
          name = "servant-swagger-ui";
          version = "0.3.0.3.13.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
        author = "Oleg Grenrus <oleg.grenrus@iki.fi>";
        homepage = "https://github.com/phadej/servant-swagger-ui";
        url = "";
        synopsis = "Servant swagger ui";
        description = "Provide embedded swagger UI for servant and swagger (i.e. servant-swagger)";
        buildType = "Simple";
      };
      components = {
        servant-swagger-ui = {
          depends  = [
            hsPkgs.servant-swagger-ui-core
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.file-embed-lzma
            hsPkgs.servant
            hsPkgs.servant-server
            hsPkgs.swagger2
            hsPkgs.text
          ];
        };
      };
    }