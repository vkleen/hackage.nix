{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "bindings-saga-cmd";
          version = "0.1.1.1";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "michel.kuhlmann@tkconsult.ch";
        author = "Michel Kuhlmann";
        homepage = "https://github.com/michelk/bindings-saga-cmd.hs";
        url = "";
        synopsis = "Wrapping saga_cmd";
        description = "A simple wrapper around the command-line version of the GIS-program saga";
        buildType = "Simple";
      };
      components = {
        bindings-saga-cmd = {
          depends  = [
            hsPkgs.base
            hsPkgs.filepath
            hsPkgs.process
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.unix
          ];
        };
        exes = {
          sagaPipe = {
            depends  = [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.cmdargs
              hsPkgs.process
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.unix
              hsPkgs.bindings-saga-cmd
            ];
          };
          sagaTopo = {
            depends  = [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.cmdargs
              hsPkgs.process
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.unix
              hsPkgs.bindings-saga-cmd
            ];
          };
          sagaLut = {
            depends  = [
              hsPkgs.base
              hsPkgs.bindings-saga-cmd
            ];
          };
        };
      };
    }