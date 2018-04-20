{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "shana";
          version = "2009.12.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Wang, Jinjing <nfjinjing@gmail.com>";
        author = "Wang, Jinjing";
        homepage = "http://github.com/nfjinjing/hack/tree/master";
        url = "";
        synopsis = "treat haskell functions as unix pipes";
        description = "main = shana - ls \".\" > grep \"src\"";
        buildType = "Simple";
      };
      components = {
        shana = {
          depends  = [
            hsPkgs.base
            hsPkgs.directory
            hsPkgs.regex-posix
          ];
        };
      };
    }