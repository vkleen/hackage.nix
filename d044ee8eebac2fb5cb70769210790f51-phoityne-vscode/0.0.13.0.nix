{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "phoityne-vscode";
          version = "0.0.13.0";
        };
        license = "BSD-3-Clause";
        copyright = "2016 phoityne_hs";
        maintainer = "phoityne.hs@gmail.com";
        author = "phoityne_hs";
        homepage = "https://github.com/phoityne/phoityne-vscode";
        url = "";
        synopsis = "ghci debug viewer on Visual Studio Code";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        exes = {
          phoityne-vscode = {
            depends  = [
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.Cabal
              hsPkgs.hslogger
              hsPkgs.ConfigFile
              hsPkgs.cmdargs
              hsPkgs.MissingH
              hsPkgs.safe
              hsPkgs.aeson
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.conduit
              hsPkgs.conduit-extra
              hsPkgs.text
              hsPkgs.resourcet
              hsPkgs.process
              hsPkgs.HStringTemplate
              hsPkgs.transformers
              hsPkgs.mtl
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.parsec
              hsPkgs.split
              hsPkgs.fsnotify
            ];
          };
        };
      };
    }