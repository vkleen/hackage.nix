{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "cityhash";
          version = "0.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "as@hacks.yi.org";
        author = "Austin Seipp";
        homepage = "http://github.com/thoughtpolice/hs-cityhash";
        url = "";
        synopsis = "Bindings to CityHash";
        description = "This package implements a binding to the CityHash family of hashing functions (implemented in C++.)\n\nSee <http://code.google.com/p/cityhash/> for more information.";
        buildType = "Simple";
      };
      components = {
        cityhash = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.largeword
          ];
          libs = [ pkgs."stdc++" ];
        };
        tests = {
          properties = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-quickcheck2
              hsPkgs.cityhash
            ];
          };
        };
      };
    }