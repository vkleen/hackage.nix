{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "snow-white";
          version = "2009.12.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Wang, Jinjing <nfjinjing@gmail.com>";
        author = "Wang, Jinjing";
        homepage = "http://github.com/nfjinjing/snow-white";
        url = "";
        synopsis = "encode any binary instance to white space";
        description = "SnowWhite.pack \"hello\"\n>\nSnowWhite.unpack \"                                                             \t \t \t\t \t    \t\t  \t \t \t\t \t\t   \t\t \t\t   \t\t \t\t\t\t\"\n> hello";
        buildType = "Simple";
      };
      components = {
        snow-white = {
          depends  = [
            hsPkgs.base
            hsPkgs.mps
            hsPkgs.bytestring
            hsPkgs.binary
          ];
        };
      };
    }