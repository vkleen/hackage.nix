{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "tx";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "(c) 2013 Michael Schröder";
        maintainer = "mc.schroeder@gmail.com";
        author = "Michael Schröder";
        homepage = "https://github.com/mcschroeder/tx";
        url = "";
        synopsis = "Persistent transactions on top of STM.";
        description = "Persistent transactions on top of STM.";
        buildType = "Simple";
      };
      components = {
        tx = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.cereal
            hsPkgs.safecopy
            hsPkgs.stm
            hsPkgs.transformers
          ];
        };
      };
    }