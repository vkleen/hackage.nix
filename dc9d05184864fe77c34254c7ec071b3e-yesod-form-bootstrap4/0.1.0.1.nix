{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yesod-form-bootstrap4";
          version = "0.1.0.1";
        };
        license = "MIT";
        copyright = "© ncaq";
        maintainer = "ncaq@ncaq.net";
        author = "ncaq";
        homepage = "https://github.com/ncaq/yesod-form-bootstrap4.git#readme";
        url = "";
        synopsis = "renderBootstrap4";
        description = "";
        buildType = "Simple";
      };
      components = {
        yesod-form-bootstrap4 = {
          depends  = [
            hsPkgs.base
            hsPkgs.classy-prelude-yesod
            hsPkgs.yesod-form
          ];
        };
      };
    }