{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hdocs";
          version = "0.3.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "voidex@live.com";
        author = "Alexandr `Voidex` Ruchkin";
        homepage = "https://github.com/mvoidex/hdocs";
        url = "";
        synopsis = "Haskell docs tool";
        description = "Tool and library to get docs for installed packages and source files.\nCan return result in JSON format.\n\n@Usage:\nhdocs <module> - get docs for module/file\nhdocs <module> <name> - get docs for name in module/file\nflags\n-g GHC_OPT  --ghc=GHC_OPT  option to pass to GHC\n@";
        buildType = "Simple";
      };
      components = {
        hdocs = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.bytestring
            hsPkgs.filepath
            hsPkgs.ghc
            hsPkgs.ghc-paths
            hsPkgs.haddock
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.MonadCatchIO-transformers
            hsPkgs.network
            hsPkgs.process
            hsPkgs.text
            hsPkgs.mtl
          ];
        };
        exes = {
          hdocs = {
            depends  = [
              hsPkgs.base
              hsPkgs.hdocs
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.filepath
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.text
            ];
          };
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.hdocs
              hsPkgs.containers
              hsPkgs.mtl
            ];
          };
        };
      };
    }