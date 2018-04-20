{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "collection-json";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "2015 Daniel Choi";
        maintainer = "dhchoi@gmail.com";
        author = "Daniel Choi";
        homepage = "https://github.com/danchoi/collection-json.hs";
        url = "";
        synopsis = "Collection+JSON hypermedia type tools";
        description = "Collection+JSON hypermedia type tools";
        buildType = "Simple";
      };
      components = {
        collection-json = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.text
            hsPkgs.bytestring
          ];
        };
      };
    }