{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "hsparklines";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "<hitesh.jasani@gmail.com>";
        author = "Hitesh Jasani";
        homepage = "http://www.jasani.org/search/label/hsparklines";
        url = "";
        synopsis = "Sparklines for Haskell";
        description = "Sparklines implementation of smooth and bar graphs";
        buildType = "Simple";
      };
      components = {
        hsparklines = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.gd
            hsPkgs.dataenc
          ];
        };
      };
    }