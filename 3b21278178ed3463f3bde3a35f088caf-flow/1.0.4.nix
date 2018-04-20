{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "flow";
          version = "1.0.4";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Taylor Fausak";
        author = "";
        homepage = "https://github.com/tfausak/flow#readme";
        url = "";
        synopsis = "Write more understandable Haskell.";
        description = "Flow provides operators for writing more understandable Haskell.";
        buildType = "Simple";
      };
      components = {
        flow = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          flow-test-suite = {
            depends  = [
              hsPkgs.base
              hsPkgs.doctest
              hsPkgs.flow
              hsPkgs.QuickCheck
              hsPkgs.template-haskell
            ];
          };
        };
      };
    }