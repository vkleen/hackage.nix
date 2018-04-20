{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "webapp";
          version = "0.4.0";
        };
        license = "MIT";
        copyright = "(c) 2015 Nathaniel Symer";
        maintainer = "Nathaniel Symer <nate@symer.io>";
        author = "Nathaniel Symer <nate@symer.io>";
        homepage = "https://github.com/natesymer/webapp";
        url = "";
        synopsis = "Haskell web app framework based on WAI & Warp";
        description = "See README.md";
        buildType = "Simple";
      };
      components = {
        webapp = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.stm
            hsPkgs.transformers
            hsPkgs.wai
            hsPkgs.warp
            hsPkgs.warp-tls
            hsPkgs.network
            hsPkgs.regex-posix
            hsPkgs.http-types
            hsPkgs.unix
            hsPkgs.blaze-builder
            hsPkgs.optparse-applicative
            hsPkgs.case-insensitive
            hsPkgs.vault
          ];
        };
      };
    }