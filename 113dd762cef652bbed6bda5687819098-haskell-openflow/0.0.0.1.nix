{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "haskell-openflow";
          version = "0.0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "brooks.brian@gmail.com";
        author = "Brian Brooks";
        homepage = "https://github.com/brooksbp/haskell-openflow";
        url = "";
        synopsis = "OpenFlow protocol in Haskell";
        description = "OpenFlow assists in network virtualization where multiple\nisolated logical networks can share physical hardware.";
        buildType = "Simple";
      };
      components = {
        haskell-openflow = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.network
            hsPkgs.network-info
            hsPkgs.cereal
          ];
        };
        tests = {
          test-main = {
            depends  = [
              hsPkgs.base
              hsPkgs.haskell-openflow
            ];
          };
        };
      };
    }