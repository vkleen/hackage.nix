{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hsdev";
          version = "0.1.3.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "voidex@live.com";
        author = "Alexandr `Voidex` Ruchkin";
        homepage = "https://github.com/mvoidex/hsdev";
        url = "";
        synopsis = "Haskell development library and tool with support of autocompletion, symbol info, go to declaration, find references etc.";
        description = "Haskell development library and tool with support of autocompletion, symbol info, go to declaration, find references, hayoo search etc.";
        buildType = "Simple";
      };
      components = {
        hsdev = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.aeson-pretty
            hsPkgs.array
            hsPkgs.attoparsec
            hsPkgs.bytestring
            hsPkgs.Cabal
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.directory
            hsPkgs.exceptions
            hsPkgs.filepath
            hsPkgs.ghc
            hsPkgs.ghc-mod
            hsPkgs.ghc-paths
            hsPkgs.haddock-api
            hsPkgs.haskell-src-exts
            hsPkgs.hdocs
            hsPkgs.HTTP
            hsPkgs.lens
            hsPkgs.monad-loops
            hsPkgs.mtl
            hsPkgs.network
            hsPkgs.process
            hsPkgs.regex-pcre-builtin
            hsPkgs.scientific
            hsPkgs.template-haskell
            hsPkgs.text
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.uniplate
            hsPkgs.unordered-containers
            hsPkgs.vector
          ] ++ (if system.isWindows
            then [ hsPkgs.Win32 ]
            else [ hsPkgs.unix ]);
        };
        exes = {
          hsdev = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.deepseq
              hsPkgs.directory
              hsPkgs.exceptions
              hsPkgs.filepath
              hsPkgs.monad-loops
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.process
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.unordered-containers
            ];
          };
          hsinspect = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.mtl
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.unordered-containers
              hsPkgs.vector
            ];
          };
          hsclearimports = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.ghc
              hsPkgs.haskell-src-exts
              hsPkgs.mtl
              hsPkgs.text
              hsPkgs.unordered-containers
            ];
          };
          hscabal = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.mtl
              hsPkgs.text
              hsPkgs.unordered-containers
            ];
          };
          hshayoo = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.mtl
              hsPkgs.text
              hsPkgs.unordered-containers
            ];
          };
          hsautofix = {
            depends  = [
              hsPkgs.base
              hsPkgs.hsdev
              hsPkgs.aeson
              hsPkgs.aeson-pretty
              hsPkgs.bytestring
              hsPkgs.directory
              hsPkgs.mtl
            ];
          };
        };
        tests = {
          test = {
            depends  = [ hsPkgs.base ];
          };
        };
      };
    }