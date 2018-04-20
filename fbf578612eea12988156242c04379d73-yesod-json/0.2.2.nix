{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "yesod-json";
          version = "0.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Snoyman <michael@snoyman.com>";
        author = "Michael Snoyman <michael@snoyman.com>";
        homepage = "http://www.yesodweb.com/";
        url = "";
        synopsis = "Generate content for Yesod using the aeson package.";
        description = "Generate content for Yesod using the aeson package.";
        buildType = "Simple";
      };
      components = {
        yesod-json = {
          depends  = [
            hsPkgs.base
            hsPkgs.yesod-core
            hsPkgs.aeson
            hsPkgs.text
            hsPkgs.shakespeare-js
            hsPkgs.vector
            hsPkgs.containers
          ];
        };
      };
    }