{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      derivedatatypeable = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "tagged";
          version = "0.2.3.1";
        };
        license = "BSD-3-Clause";
        copyright = "2009-2011 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/tagged";
        url = "";
        synopsis = "Provides newtype wrappers for phantom types to avoid unsafely passing dummy arguments";
        description = "Provides newtype wrappers for phantom types to avoid unsafely passing dummy arguments";
        buildType = "Simple";
      };
      components = {
        tagged = {
          depends  = [
            hsPkgs.base
            hsPkgs.data-default
            hsPkgs.semigroups
          ];
        };
      };
    }