{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "elm-init";
          version = "1.0.2";
        };
        license = "MIT";
        copyright = "";
        maintainer = "dev@justus.science";
        author = "Justus Adam";
        homepage = "";
        url = "";
        synopsis = "Set up basic structure for an elm project";
        description = "Initialize a new empty elm project with some basic scaffolding according to 'https://github.com/evancz/elm-architecture-tutorial'.";
        buildType = "Simple";
      };
      components = {
        exes = {
          elm-init = {
            depends  = [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.file-embed
              hsPkgs.bytestring
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.time
              hsPkgs.base-unicode-symbols
              hsPkgs.process
            ];
          };
        };
      };
    }