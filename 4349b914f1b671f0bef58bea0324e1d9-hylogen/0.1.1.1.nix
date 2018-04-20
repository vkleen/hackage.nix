{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hylogen";
          version = "0.1.1.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "freshdried@gmail.com";
        author = "Sean Lee";
        homepage = "https://hylogen.com";
        url = "";
        synopsis = "an EDSL for live-coding fragment shaders";
        description = "an EDSL for live-coding fragment shaders";
        buildType = "Simple";
      };
      components = {
        hylogen = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector-space
            hsPkgs.data-reify
          ];
        };
        exes = {
          hyde = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.filepath
              hsPkgs.fsnotify
              hsPkgs.process
              hsPkgs.text
              hsPkgs.websockets
              hsPkgs.wai
              hsPkgs.http-types
              hsPkgs.warp
            ];
          };
        };
      };
    }