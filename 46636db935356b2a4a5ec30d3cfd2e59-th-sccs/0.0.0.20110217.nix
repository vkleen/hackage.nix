{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6.0.1";
        identifier = {
          name = "th-sccs";
          version = "0.0.0.20110217";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2011 The University of Kansas";
        maintainer = "nfrisby@ittc.ku.edu";
        author = "nfrisby@ittc.ku.edu";
        homepage = "";
        url = "";
        synopsis = "Binding group analysis in Template Haskell";
        description = "th-sccs exposes Template Haskell functions for computing the\nmutually recursive binding groups for data and type synonym\ndeclarations, excluding those that use type families.\nThis includes a convenient type class for gathering the type\nconstructor names that occur within a TH @Info@\\/@Dec@\\/@Type@\nvalue.";
        buildType = "Simple";
      };
      components = {
        th-sccs = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.template-haskell
          ];
        };
      };
    }