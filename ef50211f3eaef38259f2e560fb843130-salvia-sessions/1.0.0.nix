{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "salvia-sessions";
          version = "1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "sfvisser@cs.uu.nl";
        author = "Sebastiaan Visser, Erik Hesselink";
        homepage = "";
        url = "";
        synopsis = "Session support for the Salvia webserver.";
        description = "Session support for the Salvia webserver.";
        buildType = "Simple";
      };
      components = {
        salvia-sessions = {
          depends  = [
            hsPkgs.base
            hsPkgs.safe
            hsPkgs.fclabels
            hsPkgs.pureMD5
            hsPkgs.stm
            hsPkgs.containers
            hsPkgs.MaybeT-transformers
            hsPkgs.random
            hsPkgs.time
            hsPkgs.utf8-string
            hsPkgs.salvia
            hsPkgs.salvia-protocol
            hsPkgs.monads-fd
          ];
        };
      };
    }