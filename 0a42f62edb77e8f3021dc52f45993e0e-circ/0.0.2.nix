{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "circ";
          version = "0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Tom Hawkins <tomahawkins@gmail.com>";
        author = "Tom Hawkins <tomahawkins@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "A Compiler IR Compiler.";
        description = "A Compiler IR Compiler.";
        buildType = "Simple";
      };
      components = {
        circ = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.directory
          ];
        };
      };
    }