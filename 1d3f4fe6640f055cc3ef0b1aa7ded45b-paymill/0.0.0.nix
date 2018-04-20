{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "paymill";
          version = "0.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Jakub Arnold <darthdeus@gmail.com>";
        author = "Jakub Arnold <darthdeus@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "This is an unofficial client for the Paymill API";
        description = "This is an unofficial client for the Paymill API.";
        buildType = "Simple";
      };
      components = {
        paymill = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
            ];
          };
        };
      };
    }