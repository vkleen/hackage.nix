{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      version-1-1-beta = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "sphinx";
          version = "0.6.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Greg Weber <greg@gregweber.info>, Aleksandar Dimitrov <aleks.dimitrov@gmail.com>";
        author = "Chris Eidhof <ce+sphinx@tupil.com>, Greg Weber";
        homepage = "https://github.com/gregwebs/haskell-sphinx-client";
        url = "";
        synopsis = "Haskell bindings to the Sphinx full-text searching daemon.";
        description = "Haskell bindings to the Sphinx full-text searching daemon. Compatible with Sphinx version 2.0";
        buildType = "Simple";
      };
      components = {
        sphinx = {
          depends  = [
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.data-binary-ieee754
            hsPkgs.bytestring
            hsPkgs.network
            hsPkgs.xml
            hsPkgs.text
            hsPkgs.text-icu
          ];
        };
      };
    }