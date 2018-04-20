{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      in-ghc-tree = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "haddock";
          version = "2.6.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) Simon Marlow, David Waern";
        maintainer = "David Waern <david.waern@gmail.com>";
        author = "Simon Marlow, David Waern";
        homepage = "http://www.haskell.org/haddock/";
        url = "";
        synopsis = "A documentation-generation tool for Haskell libraries";
        description = "Haddock is a documentation-generation tool for Haskell\nlibraries";
        buildType = "Simple";
      };
      components = {
        haddock = {};
        exes = {
          haddock = {
            depends  = [
              hsPkgs.base
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.pretty
              hsPkgs.containers
              hsPkgs.array
              hsPkgs.Cabal
              hsPkgs.ghc
            ] ++ pkgs.lib.optional (!_flags.in-ghc-tree) hsPkgs.ghc-paths;
          };
        };
      };
    }