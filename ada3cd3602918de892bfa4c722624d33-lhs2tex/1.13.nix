{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "lhs2tex";
          version = "1.13";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "Andres Loeh <lhs2tex@andres-loeh.de>";
        author = "Ralf Hinze <ralf@informatik.uni-bonn.de>, Andres Loeh <lhs2tex@andres-loeh.de>";
        homepage = "http://www.andres-loeh.de/lhs2tex/";
        url = "http://www.andres-loeh.de/lhs2tex/lhs2tex-1.11.tar.gz";
        synopsis = "Preprocessor for typesetting Haskell sources with LaTeX";
        description = "Preprocessor for typesetting Haskell sources with LaTeX";
        buildType = "Custom";
      };
      components = {
        exes = {
          lhs2TeX = {
            depends  = if _flags.splitbase
              then [
                hsPkgs.base
                hsPkgs.regex-compat
                hsPkgs.mtl
                hsPkgs.filepath
                hsPkgs.directory
                hsPkgs.process
              ]
              else [
                hsPkgs.base
                hsPkgs.regex-compat
                hsPkgs.mtl
                hsPkgs.filepath
              ];
          };
        };
      };
    }