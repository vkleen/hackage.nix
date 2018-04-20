{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "keera-hails-reactive-gtk";
          version = "0.0.3.5";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "ivan.perez@keera.es";
        author = "Ivan Perez";
        homepage = "http://www.keera.es/blog/community/";
        url = "";
        synopsis = "Haskell on Gtk rails - Reactive Fields for Gtk widgets";
        description = "";
        buildType = "Simple";
      };
      components = {
        keera-hails-reactive-gtk = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.transformers
            hsPkgs.gtk
            hsPkgs.gtk-helpers
            hsPkgs.keera-hails-reactivevalues
          ];
        };
      };
    }