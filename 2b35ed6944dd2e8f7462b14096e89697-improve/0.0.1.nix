{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "improve";
          version = "0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Tom Hawkins <tomahawkins@gmail.com>";
        author = "Tom Hawkins <tomahawkins@gmail.com>";
        homepage = "http://tomahawkins.org";
        url = "";
        synopsis = "A simple imperative programming language for embedded applications.";
        description = "TODO";
        buildType = "Simple";
      };
      components = {
        improve = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
          ];
        };
      };
    }