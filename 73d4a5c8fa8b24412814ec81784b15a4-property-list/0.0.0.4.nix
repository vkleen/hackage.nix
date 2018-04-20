{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "property-list";
          version = "0.0.0.4";
        };
        license = "LicenseRef-PublicDomain";
        copyright = "";
        maintainer = "James Cook <james.cook@usma.edu>";
        author = "James Cook <james.cook@usma.edu>";
        homepage = "http://code.haskell.org/~mokus/property-list";
        url = "";
        synopsis = "XML property list parser";
        description = "Parser, data type and formatter for Apple's XML property list 1.0 format.";
        buildType = "Simple";
      };
      components = {
        property-list = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.dataenc
            hsPkgs.data-object
            hsPkgs.HaXml
            hsPkgs.mtl
            hsPkgs.old-locale
            hsPkgs.pretty
            hsPkgs.time
            hsPkgs.template-haskell
            hsPkgs.th-fold
          ];
        };
      };
    }