{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hasbolt-extras";
          version = "0.0.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2018, BIOCAD";
        maintainer = "neterebskiy@biocad.ru";
        author = "Bogdan Neterebskii, Vladimir Morozov, Sofya Kochkova, Alexander Sadovnikov";
        homepage = "https://github.com/biocad/hasbolt-extras#readme";
        url = "";
        synopsis = "Extras for hasbolt library";
        description = "Extras for hasbolt library";
        buildType = "Simple";
      };
      components = {
        hasbolt-extras = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.hasbolt
            hsPkgs.containers
            hsPkgs.neat-interpolation
            hsPkgs.template-haskell
            hsPkgs.th-lift-instances
            hsPkgs.lens
          ];
        };
      };
    }