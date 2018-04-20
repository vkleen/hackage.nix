{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      small_base = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "FilePather";
          version = "0.1.4";
        };
        license = "BSD-3-Clause";
        copyright = "Tony Morris";
        maintainer = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ>";
        author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ>";
        homepage = "https://github.com/tonymorris/filepather";
        url = "";
        synopsis = "Functions on System.FilePath";
        description = "Functions over @System.FilePath@ including a find function for recursing down directories.";
        buildType = "Simple";
      };
      components = {
        FilePather = {
          depends  = [
            hsPkgs.base
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.mtl
            hsPkgs.comonad
            hsPkgs.transformers
          ];
        };
      };
    }