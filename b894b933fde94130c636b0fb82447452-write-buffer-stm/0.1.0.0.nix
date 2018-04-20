{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "write-buffer-stm";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2017 Matt Parsons";
        maintainer = "parsonsmatt@gmail.com";
        author = "Matt Parsons";
        homepage = "https://github.com/parsonsmatt/write-buffer#readme";
        url = "";
        synopsis = "A write buffer for STM channels and queues.";
        description = "See README.md";
        buildType = "Simple";
      };
      components = {
        write-buffer-stm = {
          depends  = [
            hsPkgs.base
            hsPkgs.write-buffer-core
            hsPkgs.stm
            hsPkgs.stm-chans
          ];
        };
      };
    }