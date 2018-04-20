{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yi-fuzzy-open";
          version = "0.13.3";
        };
        license = "GPL-2.0-only";
        copyright = "";
        maintainer = "Yi developers <yi-devel@googlegroups.com>";
        author = "";
        homepage = "https://github.com/yi-editor/yi#readme";
        url = "";
        synopsis = "Fuzzy open plugin for yi";
        description = "This plugin tries to do what ctrl-p does for vim and helm does for emacs.";
        buildType = "Simple";
      };
      components = {
        yi-fuzzy-open = {
          depends  = [
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.containers
            hsPkgs.data-default
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.transformers-base
            hsPkgs.vector
            hsPkgs.yi-core
            hsPkgs.yi-language
            hsPkgs.yi-rope
          ];
        };
      };
    }