{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "bindings-libstemmer";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "cosmo0920.wp@gmail.com";
        author = "cosmo0920";
        homepage = "";
        url = "";
        synopsis = "Binding for libstemmer with low level binding.";
        description = "A binding for libstemmer.";
        buildType = "Simple";
      };
      components = {
        bindings-libstemmer = {
          depends  = [
            hsPkgs.base
            hsPkgs.bindings-DSL
            hsPkgs.transformers
            hsPkgs.resourcet
          ];
          libs = [ pkgs.stemmer ];
        };
      };
    }