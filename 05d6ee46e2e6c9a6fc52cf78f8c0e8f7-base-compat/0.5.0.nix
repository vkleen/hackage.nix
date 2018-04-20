{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "base-compat";
          version = "0.5.0";
        };
        license = "MIT";
        copyright = "(c) 2012-2014 Simon Hengel,\n(c) 2014 João Cristóvão";
        maintainer = "Simon Hengel <sol@typeful.net>, João Cristóvão <jmacristovao@gmail.com>";
        author = "Simon Hengel <sol@typeful.net>, João Cristóvão <jmacristovao@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "A compatibility layer for base";
        description = "Ban CPP from your code.  See the README for what is covered:\n<https://github.com/sol/base-compat#readme>";
        buildType = "Simple";
      };
      components = {
        base-compat = {
          depends  = [
            hsPkgs.base
            hsPkgs.errorcall-eq-instance
            hsPkgs.setenv
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.base-compat
              hsPkgs.hspec
              hsPkgs.QuickCheck
            ];
          };
        };
      };
    }