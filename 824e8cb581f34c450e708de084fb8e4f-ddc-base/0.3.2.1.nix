{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "ddc-base";
          version = "0.3.2.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Ben Lippmeier <benl@ouroborus.net>";
        author = "The Disciplined Disciple Compiler Strike Force";
        homepage = "http://disciple.ouroborus.net";
        url = "";
        synopsis = "Disciplined Disciple Compiler common utilities.";
        description = "This package re-exports the main external dependencies of\nthe Disciplined Disciple Compiler project, and provides some\ncommon utilities.";
        buildType = "Simple";
      };
      components = {
        ddc-base = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.containers
            hsPkgs.wl-pprint
            hsPkgs.parsec
            hsPkgs.deepseq
          ];
        };
      };
    }