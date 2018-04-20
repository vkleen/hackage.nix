{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "cqrs-types";
          version = "0.9.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Bardur Arantsson <bardur@scientician.net>";
        author = "Bardur Arantsson";
        homepage = "";
        url = "";
        synopsis = "Command-Query Responsibility Segregation. Modules for the basic types.";
        description = "__This package has is OBSOLETE.__\n\nUse <http://hackage.haskell.org/package/cqrs-core cqrs-core>\ninstead!";
        buildType = "Simple";
      };
      components = {
        cqrs-types = {
          depends  = [ hsPkgs.base ];
        };
      };
    }