{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "data-construction";
          version = "1.0";
        };
        license = "Apache-2.0";
        copyright = "Copyright (C) 2015 Wojciech Danilo";
        maintainer = "Wojciech Danilo <wojciech.danilo@gmail.com>";
        author = "Wojciech Danilo";
        homepage = "https://github.com/wdanilo/data-construction";
        url = "";
        synopsis = "Data construction abstractions including Constructor, Destructor, Maker, Destroyer, Producer and Consumer.";
        description = "";
        buildType = "Simple";
      };
      components = {
        data-construction = {
          depends  = [ hsPkgs.base ];
        };
      };
    }