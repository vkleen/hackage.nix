{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      instanceinbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "storable-complex";
          version = "0.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Carter Schonwald <carter.schonwald@gmail.com>";
        author = "Jed Brown <jed@59A2.org>";
        homepage = "https://github.com/cartazio/storable-complex";
        url = "";
        synopsis = "Storable instance for Complex";
        description = "Provides a Storable instance for Complex which is binary\ncompatible with C99, C++ and Fortran complex data types.\n\nThe only purpose of this package is to provide a standard\nlocation for this instance so that other packages needing\nthis instance can play nicely together.";
        buildType = "Simple";
      };
      components = {
        storable-complex = {
          depends  = [ hsPkgs.base ];
        };
      };
    }