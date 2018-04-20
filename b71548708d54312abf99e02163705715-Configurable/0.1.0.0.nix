{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "Configurable";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "Joseph Abrahamson, 2012";
        maintainer = "Joseph Abrahamson <me@jspha.com>";
        author = "Joseph Abrahamson <me@jspha.com>";
        homepage = "https://github.com/tel/Configurable";
        url = "";
        synopsis = "Declare types as Configurable then specialize them all in one place";
        description = "Declare types as Configurable then specialize them all in one place";
        buildType = "Simple";
      };
      components = {
        Configurable = {
          depends  = [ hsPkgs.base ];
        };
      };
    }