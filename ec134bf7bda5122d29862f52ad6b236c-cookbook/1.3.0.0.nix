{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "cookbook";
          version = "1.3.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "nathanpisarski@gmail.com";
        author = "Nate Pisarski";
        homepage = "";
        url = "";
        synopsis = "A delicious set of interdependant libraries.";
        description = "";
        buildType = "Simple";
      };
      components = {
        cookbook = {
          depends  = [
            hsPkgs.base
            hsPkgs.directory
            hsPkgs.strict
          ];
        };
      };
    }