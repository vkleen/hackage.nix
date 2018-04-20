{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "decimal-arithmetic";
          version = "0.4.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "© 2016 Robert Leslie";
        maintainer = "Rob Leslie <rob@mars.org>";
        author = "Rob Leslie <rob@mars.org>";
        homepage = "https://github.com/verement/decimal-arithmetic#readme";
        url = "";
        synopsis = "An implementation of the General Decimal Arithmetic\nSpecification";
        description = "This package provides an implementation of the General\nDecimal Arithmetic Specification by Mike Cowlishaw.\n\nFor details, see <http://speleotrove.com/decimal/>";
        buildType = "Simple";
      };
      components = {
        decimal-arithmetic = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
          ];
        };
        tests = {
          doctests = {
            depends  = [
              hsPkgs.base
              hsPkgs.decimal-arithmetic
              hsPkgs.doctest
              hsPkgs.QuickCheck
            ];
          };
        };
      };
    }