{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "exinst-hashable";
          version = "0.2";
        };
        license = "BSD-3-Clause";
        copyright = "Renzo Carbonara 2015-2016";
        maintainer = "renzoλcarbonara.com.ar";
        author = "Renzo Carbonara";
        homepage = "https://github.com/k0001/exinst";
        url = "";
        synopsis = "Derive instances for the `hashable` library for your existential types.";
        description = "";
        buildType = "Simple";
      };
      components = {
        exinst-hashable = {
          depends  = [
            hsPkgs.base
            hsPkgs.hashable
            hsPkgs.constraints
            hsPkgs.exinst
            hsPkgs.singletons
          ];
        };
      };
    }