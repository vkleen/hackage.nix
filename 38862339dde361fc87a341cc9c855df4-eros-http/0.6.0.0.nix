{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "eros-http";
          version = "0.6.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2014, Peter Harpending";
        maintainer = "Peter Harpending <pharpend2@gmail.com>";
        author = "Peter Harpending";
        homepage = "";
        url = "";
        synopsis = "JSON HTTP interface to Eros.";
        description = "This is a small program that runs an HTTP server.\n\nChangelog\n\n[0.6] Update to be compatible with Eros v.0.6";
        buildType = "Simple";
      };
      components = {
        exes = {
          eros-http = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.blaze-html
              hsPkgs.bytestring
              hsPkgs.eros
              hsPkgs.http-types
              hsPkgs.markdown
              hsPkgs.text
              hsPkgs.wai
              hsPkgs.wai-responsible
              hsPkgs.warp
            ];
          };
        };
      };
    }