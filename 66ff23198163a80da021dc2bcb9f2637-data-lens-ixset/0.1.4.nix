{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.9.2";
        identifier = {
          name = "data-lens-ixset";
          version = "0.1.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "dag.odenhall@gmail.com";
        author = "Dag Odenhall";
        homepage = "https://github.com/dag/data-lens-ixset";
        url = "";
        synopsis = "A Lens for IxSet";
        description = "Integrates Data.IxSet with Data.Lens.";
        buildType = "Simple";
      };
      components = {
        data-lens-ixset = {
          depends  = [
            hsPkgs.base
            hsPkgs.data-lens
            hsPkgs.ixset
          ];
        };
        tests = {
          test-data-lens-ixset = {
            depends  = [
              hsPkgs.QuickCheck
            ];
          };
        };
      };
    }