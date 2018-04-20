{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yam-servant";
          version = "0.1.4";
        };
        license = "BSD-3-Clause";
        copyright = "(c) Daniel YU";
        maintainer = "Daniel YU <leptonyu@gmail.com>";
        author = "Daniel YU";
        homepage = "https://github.com/leptonyu/yam/yam-servant#readme";
        url = "";
        synopsis = "";
        description = "Web Module for Yam";
        buildType = "Simple";
      };
      components = {
        yam-servant = {
          depends  = [
            hsPkgs.base
            hsPkgs.yam-app
            hsPkgs.yam-job
            hsPkgs.servant
            hsPkgs.servant-server
            hsPkgs.servant-swagger
            hsPkgs.servant-swagger-ui
            hsPkgs.swagger2
            hsPkgs.wai
            hsPkgs.wai-extra
            hsPkgs.warp
            hsPkgs.aeson
            hsPkgs.lens
            hsPkgs.data-default
          ];
        };
      };
    }