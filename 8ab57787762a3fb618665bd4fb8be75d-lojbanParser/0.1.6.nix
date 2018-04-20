{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "lojbanParser";
          version = "0.1.6";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = ".iocikun.juj. <PAF01143@nifty.ne.jp>";
        author = ".iocikun.juj. <PAF01143@nifty.ne.jp>";
        homepage = "";
        url = "";
        synopsis = "lojban parser";
        description = "This is alpha version. The interface may change.";
        buildType = "Simple";
      };
      components = {
        lojbanParser = {};
        exes = {
          testParser = {
            depends  = [ hsPkgs.base ];
          };
        };
      };
    }