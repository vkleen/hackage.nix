{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yi";
          version = "0.13.0.1";
        };
        license = "GPL-2.0-only";
        copyright = "";
        maintainer = "Yi developers <yi-devel@googlegroups.com>";
        author = "";
        homepage = "https://github.com/yi-editor/yi#readme";
        url = "";
        synopsis = "Yi editor";
        description = "";
        buildType = "Simple";
      };
      components = {
        exes = {
          yi = {
            depends  = [
              hsPkgs.base
              hsPkgs.yi-core
            ];
          };
        };
      };
    }