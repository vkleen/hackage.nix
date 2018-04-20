{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      ghci = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ghci";
          version = "8.2.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "ghc-devs@haskell.org";
        author = "";
        homepage = "";
        url = "";
        synopsis = "The library supporting GHC's interactive interpreter";
        description = "This library offers interfaces which mediate interactions between the\n@ghci@ interactive shell and @iserv@, GHC's out-of-process interpreter\nbackend.";
        buildType = "Simple";
      };
      components = {
        ghci = {
          depends  = [
            hsPkgs.array
            hsPkgs.base
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.filepath
            hsPkgs.ghc-boot
            hsPkgs.ghc-boot-th
            hsPkgs.template-haskell
            hsPkgs.transformers
          ] ++ pkgs.lib.optional (!system.isWindows) hsPkgs.unix;
        };
      };
    }