{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "aeson-value-parser";
          version = "0.12.3";
        };
        license = "MIT";
        copyright = "(c) 2015, Sannsyn AS";
        maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
        author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
        homepage = "https://github.com/sannsyn/aeson-value-parser";
        url = "";
        synopsis = "An API for parsing \"aeson\" JSON tree into Haskell types";
        description = "";
        buildType = "Simple";
      };
      components = {
        aeson-value-parser = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.json-pointer
            hsPkgs.json-pointer-aeson
            hsPkgs.unordered-containers
            hsPkgs.vector
            hsPkgs.scientific
            hsPkgs.text
            hsPkgs.foldl
            hsPkgs.transformers
            hsPkgs.mtl-prelude
            hsPkgs.base-prelude
          ];
        };
      };
    }