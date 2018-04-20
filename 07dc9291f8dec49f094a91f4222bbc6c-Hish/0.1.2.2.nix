{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.12";
        identifier = {
          name = "Hish";
          version = "0.1.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "jaiyalas@gmail.com";
        author = "Yun-Yan Chi";
        homepage = "https://github.com/jaiyalas/Hish";
        url = "";
        synopsis = "";
        description = "Generating a beautiful and useful prompt.";
        buildType = "Simple";
      };
      components = {
        Hish = {
          depends  = [
            hsPkgs.base
            hsPkgs.MissingH
            hsPkgs.process
            hsPkgs.regex-tdfa
            hsPkgs.time
            hsPkgs.directory
          ];
        };
        exes = {
          hish = {
            depends  = [
              hsPkgs.base
              hsPkgs.MissingH
              hsPkgs.process
              hsPkgs.regex-tdfa
              hsPkgs.time
              hsPkgs.directory
            ];
          };
        };
      };
    }