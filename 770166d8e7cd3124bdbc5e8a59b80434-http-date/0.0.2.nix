{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "http-date";
          version = "0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
        author = "Kazu Yamamoto <kazu@iij.ad.jp>";
        homepage = "";
        url = "";
        synopsis = "HTTP Date parser/formatter";
        description = "Fast parser and formatter for HTTP Date";
        buildType = "Simple";
      };
      components = {
        http-date = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.attoparsec
            hsPkgs.bytestring
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.http-date
              hsPkgs.old-locale
              hsPkgs.time
              hsPkgs.HUnit
              hsPkgs.test-framework-doctest
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-th-prime
            ];
          };
        };
      };
    }