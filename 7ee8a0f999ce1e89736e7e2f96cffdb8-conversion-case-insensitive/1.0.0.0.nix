{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "conversion-case-insensitive";
          version = "1.0.0.0";
        };
        license = "MIT";
        copyright = "(c) 2015, Nikita Volkov";
        maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
        author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
        homepage = "https://github.com/nikita-volkov/conversion-case-insensitive";
        url = "";
        synopsis = "\"Conversion\" instances for the \"case-insensitive\" library";
        description = "";
        buildType = "Simple";
      };
      components = {
        conversion-case-insensitive = {
          depends  = [
            hsPkgs.case-insensitive
            hsPkgs.conversion
          ];
        };
      };
    }