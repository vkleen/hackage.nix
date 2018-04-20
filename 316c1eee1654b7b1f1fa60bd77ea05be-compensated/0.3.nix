{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      test-doctests = true;
      lib-werror = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "compensated";
          version = "0.3";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2013 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/analytics/compensated/";
        url = "";
        synopsis = "Compensated floating-point arithmetic";
        description = "This package provides compensated floating point arithmetic.";
        buildType = "Custom";
      };
      components = {
        compensated = {
          depends  = [
            hsPkgs.base
            hsPkgs.bifunctors
            hsPkgs.binary
            hsPkgs.cereal
            hsPkgs.comonad
            hsPkgs.deepseq
            hsPkgs.distributive
            hsPkgs.generic-deriving
            hsPkgs.hashable
            hsPkgs.lens
            hsPkgs.log-domain
            hsPkgs.semigroupoids
            hsPkgs.semigroups
            hsPkgs.safecopy
            hsPkgs.vector
          ];
        };
        tests = {
          doctests = {
            depends  = pkgs.lib.optionals (!(!_flags.test-doctests)) [
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.doctest
              hsPkgs.filepath
              hsPkgs.generic-deriving
              hsPkgs.semigroups
              hsPkgs.simple-reflect
            ];
          };
        };
      };
    }