{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "ismtp";
          version = "4.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2011 Ertugrul Söylemez";
        maintainer = "Ertugrul Söylemez <es@ertes.de>";
        author = "Ertugrul Söylemez <es@ertes.de>";
        homepage = "";
        url = "";
        synopsis = "Advanced ESMTP library";
        description = "This library provides fast, incremental, iteratee-based client-side\nESMTP sessions for mail exchangers and other mail transfer agents.";
        buildType = "Simple";
      };
      components = {
        ismtp = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.contstuff
            hsPkgs.dnscache
            hsPkgs.enumerator
            hsPkgs.lifted-base
            hsPkgs.monad-control
            hsPkgs.netlines
            hsPkgs.network
            hsPkgs.vector
          ];
        };
      };
    }