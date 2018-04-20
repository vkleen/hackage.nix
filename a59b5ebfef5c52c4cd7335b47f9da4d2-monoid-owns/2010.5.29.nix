{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "monoid-owns";
          version = "2010.5.29";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Jinjing Wang <nfjinjing@gmail.com>";
        author = "Jinjing Wang";
        homepage = "http://github.com/nfjinjing/monoid-owns";
        url = "";
        synopsis = "a practical monoid implementation";
        description = "a practical monoid implementation";
        buildType = "Simple";
      };
      components = {
        monoid-owns = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.bytestring
          ];
        };
      };
    }