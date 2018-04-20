{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "lambdacube";
          version = "2008.12.24";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Lennart Augustsson <lennart@augustsson.net>";
        author = "Lennart Augustsson <lennart@augustsson.net>";
        homepage = "";
        url = "";
        synopsis = "A simple lambda cube type checker.";
        description = "A simple interactive lambda cube type checker and evaluator.";
        buildType = "Simple";
      };
      components = {
        exes = {
          cube = {
            depends  = [
              hsPkgs.base
              hsPkgs.pretty
              hsPkgs.mtl
              hsPkgs.editline
            ];
          };
        };
      };
    }