{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "byteorder";
          version = "1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Antoine Latter <aslatter@gmail.com>";
        author = "Antoine Latter";
        homepage = "http://community.haskell.org/~aslatter/code/byteorder";
        url = "";
        synopsis = "native byte-ordering of the system";
        description = "This package is for working with the native byte-ordering of\nthe system.";
        buildType = "Simple";
      };
      components = {
        byteorder = {
          depends  = [ hsPkgs.base ];
        };
      };
    }