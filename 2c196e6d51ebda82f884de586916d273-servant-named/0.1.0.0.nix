{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "servant-named";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2017 Ben Weitzman";
        maintainer = "benweitzman@gmail.com";
        author = "Ben Weitzman";
        homepage = "https://github.com/bemweitzman/servant-named#readme";
        url = "";
        synopsis = "Add named endpoints to servant";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        servant-named = {
          depends  = [
            hsPkgs.base
            hsPkgs.servant
          ];
        };
        tests = {
          servant-named-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.servant-named
              hsPkgs.servant
              hsPkgs.hspec
              hsPkgs.hspec-wai
              hsPkgs.http-types
              hsPkgs.servant-server
            ];
          };
        };
      };
    }