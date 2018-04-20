{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "distributed-process-monad-control";
          version = "0.4.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "jeremy@jeremyhuffman.com";
        author = "Jeremy Huffman";
        homepage = "http://http://haskell-distributed.github.io";
        url = "";
        synopsis = "Orphan instances for MonadBase and MonadBaseControl.";
        description = "";
        buildType = "Simple";
      };
      components = {
        distributed-process-monad-control = {
          depends  = [
            hsPkgs.base
            hsPkgs.distributed-process
            hsPkgs.monad-control
            hsPkgs.transformers
            hsPkgs.transformers-base
          ];
        };
      };
    }