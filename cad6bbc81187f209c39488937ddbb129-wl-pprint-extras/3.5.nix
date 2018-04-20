{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "wl-pprint-extras";
          version = "3.5";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2011-2012 Edward A. Kmett,\nCopyright (C) 2000 Daan Leijen";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/wl-pprint-extras/";
        url = "";
        synopsis = "A free monad based on the Wadler/Leijen pretty printer";
        description = "A free monad based on the Wadler/Leijen pretty printer";
        buildType = "Simple";
      };
      components = {
        wl-pprint-extras = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.nats
            hsPkgs.semigroups
            hsPkgs.semigroupoids
            hsPkgs.utf8-string
            hsPkgs.text
          ];
        };
        tests = {
          wl-pprint-tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.wl-pprint-extras
              hsPkgs.HUnit
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
            ];
          };
        };
      };
    }