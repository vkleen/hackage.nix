{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "gitlib-sample";
          version = "3.0.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "johnw@newartisans.com";
        author = "John Wiegley";
        homepage = "";
        url = "";
        synopsis = "Sample backend for gitlib showing the basic structure for any backend.";
        description = "Sample backend for @gitlib@.";
        buildType = "Simple";
      };
      components = {
        gitlib-sample = {
          depends  = [
            hsPkgs.base
            hsPkgs.failure
            hsPkgs.gitlib
            hsPkgs.mtl
            hsPkgs.transformers
          ];
        };
      };
    }