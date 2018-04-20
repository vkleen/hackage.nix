{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "witherable";
          version = "0.1.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2014 Fumiaki Kinoshita";
        maintainer = "Fumiaki Kinoshita <fumiexcel@gmail.com>";
        author = "Fumiaki Kinoshita";
        homepage = "https://github.com/fumieval/witherable";
        url = "";
        synopsis = "Generalization of filter and catMaybes";
        description = "";
        buildType = "Simple";
      };
      components = {
        witherable = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.vector
            hsPkgs.unordered-containers
            hsPkgs.hashable
            hsPkgs.transformers
          ];
        };
      };
    }