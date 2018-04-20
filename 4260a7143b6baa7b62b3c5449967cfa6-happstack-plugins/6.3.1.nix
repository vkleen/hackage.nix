{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      base4 = true;
      tests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "happstack-plugins";
          version = "6.3.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Happstack team <happs@googlegroups.com>";
        author = "Happstack team, HAppS LLC";
        homepage = "http://happstack.com";
        url = "";
        synopsis = "The haskell application server stack + reload";
        description = "This library provides support for automatically recompiling and reloading modules into a running server.";
        buildType = "Simple";
      };
      components = {
        happstack-plugins = {
          depends  = [
            hsPkgs.base
            hsPkgs.plugins-auto
            hsPkgs.mtl
            hsPkgs.happstack-server
            hsPkgs.template-haskell
            hsPkgs.th-lift
          ];
        };
      };
    }