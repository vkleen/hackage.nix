{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "regex-genex";
          version = "0.2.0";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "2011 Audrey Tang";
        maintainer = "Audrey Tang <audreyt@audreyt.org>";
        author = "Audrey Tang <audreyt@audreyt.org>";
        homepage = "https://github.com/audreyt/regex-genex";
        url = "";
        synopsis = "From a regex, generate all possible strings it can match";
        description = "From a regex, generate all possible strings it can match";
        buildType = "Simple";
      };
      components = {
        regex-genex = {
          depends  = [
            hsPkgs.base
            hsPkgs.haskell98
            hsPkgs.mtl
            hsPkgs.containers
            hsPkgs.sbv
            hsPkgs.regex-tdfa
          ];
        };
        exes = {
          genex = {
            depends  = [
              hsPkgs.base
              hsPkgs.haskell98
              hsPkgs.mtl
              hsPkgs.containers
              hsPkgs.sbv
              hsPkgs.regex-tdfa
            ];
          };
        };
      };
    }