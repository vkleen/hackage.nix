{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hakyll-agda";
          version = "0.1.10";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Francesco Mazzoli (f@mazzo.li)";
        author = "Francesco Mazzoli (f@mazzo.li)";
        homepage = "https://github.com/bitonic/hakyll-agda";
        url = "";
        synopsis = "Wrapper to integrate literate Agda files with Hakyll";
        description = "Simple module useful to generate blog posts from literate\nAgda files.  See <http://mazzo.li/posts/agda-hakyll.html>\nfor more info.";
        buildType = "Simple";
      };
      components = {
        hakyll-agda = {
          depends  = [
            hsPkgs.base
            hsPkgs.Agda
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.hakyll
            hsPkgs.mtl
            hsPkgs.pandoc
            hsPkgs.transformers
            hsPkgs.xhtml
          ];
        };
      };
    }