{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "franchise";
          version = "0.0";
        };
        license = "BSD-3-Clause";
        copyright = "David Roundy";
        maintainer = "David Roundy <droundy@darcs.net>";
        author = "";
        homepage = "";
        url = "";
        synopsis = "A package for configuring and building Haskell software";
        description = "Franchise is an easy-to use package for building Haskell\nsoftware.  Unlike Cabal, you aren't required to track every\npossible dependency in every possible build condition.  In\naddition, you are not required to use an external tool such as\nautoconf in order to configure the build based on which\npackages, libraries and tools are present.";
        buildType = "Custom";
      };
      components = {
        franchise = {
          depends  = [
            hsPkgs.haskell98
            hsPkgs.base
            hsPkgs.process
            hsPkgs.directory
          ];
        };
      };
    }