{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "antagonist";
          version = "0.1.0.30";
        };
        license = "AGPL-3.0-only";
        copyright = "";
        maintainer = "marvin.cohrs@gmx.net";
        author = "Marvin Cohrs";
        homepage = "http://doomanddarkness.eu/pub/antisplice";
        url = "";
        synopsis = "A web interface to Antisplice dungeons.";
        description = "A web interface to Antisplice dungeons, implemented as a yesod subsite.";
        buildType = "Simple";
      };
      components = {
        antagonist = {
          depends  = [
            hsPkgs.base
            hsPkgs.yesod
            hsPkgs.antisplice
            hsPkgs.text
            hsPkgs.chatty
            hsPkgs.chatty-utils
            hsPkgs.shakespeare
            hsPkgs.mtl
            hsPkgs.time
            hsPkgs.yesod-auth
            hsPkgs.time-locale-compat
          ];
        };
        exes = {
          ironforge-yesod = {
            depends  = [
              hsPkgs.base
              hsPkgs.yesod
              hsPkgs.antisplice
              hsPkgs.text
              hsPkgs.chatty
              hsPkgs.chatty-utils
              hsPkgs.shakespeare
              hsPkgs.mtl
              hsPkgs.ironforge
              hsPkgs.time
              hsPkgs.yesod-auth
              hsPkgs.time-locale-compat
            ];
          };
        };
      };
    }