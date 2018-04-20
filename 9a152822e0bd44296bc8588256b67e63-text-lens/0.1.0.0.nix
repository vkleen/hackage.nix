{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "text-lens";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "2016 Chris Penner";
        maintainer = "christopher.penner@gmail.com";
        author = "Chris Penner";
        homepage = "https://github.com/ChrisPenner/rasa";
        url = "";
        synopsis = "Lenses for operating over text";
        description = "Lenses for operating over text";
        buildType = "Simple";
      };
      components = {
        text-lens = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.lens
            hsPkgs.extra
          ];
        };
        tests = {
          text-lens-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.text-lens
              hsPkgs.hspec
              hsPkgs.lens
            ];
          };
        };
      };
    }