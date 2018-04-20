{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "on-demand-ssh-tunnel";
          version = "0.1.0.6";
        };
        license = "MIT";
        copyright = "(c) 2015 Predrag Radovic";
        maintainer = "predrg@gmail.com";
        author = "Predrag Radovic";
        homepage = "https://github.com/crackleware/on-demand-ssh-tunnel";
        url = "";
        synopsis = "Program that sends traffic through SSH tunnels on-demand";
        description = "Program that sends traffic through SSH tunnels on-demand";
        buildType = "Simple";
      };
      components = {
        on-demand-ssh-tunnel = {
          depends  = [
            hsPkgs.base
            hsPkgs.network
            hsPkgs.bytestring
            hsPkgs.random
            hsPkgs.process
            hsPkgs.GenericPretty
          ];
        };
        exes = {
          on-demand-ssh-tunnel = {
            depends  = [
              hsPkgs.base
              hsPkgs.network
              hsPkgs.bytestring
              hsPkgs.random
              hsPkgs.process
              hsPkgs.GenericPretty
              hsPkgs.on-demand-ssh-tunnel
            ];
          };
        };
      };
    }