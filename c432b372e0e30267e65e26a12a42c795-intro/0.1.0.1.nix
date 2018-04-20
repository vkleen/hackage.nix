{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "intro";
          version = "0.1.0.1";
        };
        license = "MIT";
        copyright = "2016 Daniel Mendler";
        maintainer = "Daniel Mendler <mail@daniel-mendler.de>";
        author = "Daniel Mendler <mail@daniel-mendler.de>";
        homepage = "https://github.com/minad/intro#readme";
        url = "";
        synopsis = "\"Fixed Prelude\" - Mostly total and safe, provides Text and Monad transformers";
        description = "Modern Prelude which provides safe alternatives for most of the partial functions. Text is preferred over String. Container types and Monad transformers are provided. Most important - this Prelude avoids fanciness. This means it just reexports from base and commonly used libraries and doesn\\'t invent its own stuff. Everything is in one file.";
        buildType = "Simple";
      };
      components = {
        intro = {
          depends  = [
            hsPkgs.base
            hsPkgs.bifunctors
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.dlist
            hsPkgs.extra
            hsPkgs.hashable
            hsPkgs.mtl
            hsPkgs.safe
            hsPkgs.string-conversions
            hsPkgs.tagged
            hsPkgs.text
            hsPkgs.transformers
            hsPkgs.unordered-containers
            hsPkgs.writer-cps-mtl
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.semigroups;
        };
        tests = {
          compat = {
            depends  = [
              hsPkgs.base
              hsPkgs.bifunctors
              hsPkgs.binary
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.deepseq
              hsPkgs.dlist
              hsPkgs.extra
              hsPkgs.hashable
              hsPkgs.mtl
              hsPkgs.safe
              hsPkgs.string-conversions
              hsPkgs.tagged
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.unordered-containers
              hsPkgs.writer-cps-mtl
              hsPkgs.intro
              hsPkgs.lens
            ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.semigroups;
          };
        };
      };
    }