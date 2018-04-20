{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "bsd-sysctl";
          version = "1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "2009, Maxime Henrion";
        maintainer = "Maxime Henrion <mhenrion@gmail.com>";
        author = "Maxime Henrion";
        homepage = "";
        url = "";
        synopsis = "Access to the BSD sysctl(3) interface";
        description = "This module provides efficient access to the BSD sysctl(3)\ninterface via the Haskell FFI.\n\nIt allows to read and write both basic sysctl types, as well as complex\nopaque types (typically C structures) described via Storable instances.";
        buildType = "Simple";
      };
      components = {
        bsd-sysctl = {
          depends  = [ hsPkgs.base ];
        };
      };
    }