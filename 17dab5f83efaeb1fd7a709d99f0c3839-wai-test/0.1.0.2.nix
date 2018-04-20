{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "wai-test";
          version = "0.1.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Snoyman <michael@snoyman.com>";
        author = "Michael Snoyman <michael@snoyman.com>";
        homepage = "http://github.com/snoyberg/wai-test/";
        url = "";
        synopsis = "Unit test framework (built on HUnit) for WAI applications.";
        description = "";
        buildType = "Simple";
      };
      components = {
        wai-test = {
          depends  = [
            hsPkgs.base
            hsPkgs.wai
            hsPkgs.bytestring
            hsPkgs.blaze-builder
            hsPkgs.transformers
            hsPkgs.containers
            hsPkgs.enumerator
            hsPkgs.cookie
            hsPkgs.blaze-builder-enumerator
            hsPkgs.HUnit
            hsPkgs.http-types
            hsPkgs.case-insensitive
          ];
        };
      };
    }