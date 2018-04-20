{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ircbot";
          version = "0.6.5.3";
        };
        license = "BSD-3-Clause";
        copyright = "2012 SeeReason Partners LLC";
        maintainer = "jeremy@seereason.com";
        author = "Jeremy Shaw, Eric Mertens";
        homepage = "https://github.com/stepcut/ircbot";
        url = "";
        synopsis = "A library for writing IRC bots";
        description = "A simple library for an IRC bot";
        buildType = "Simple";
      };
      components = {
        ircbot = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.irc
            hsPkgs.mtl
            hsPkgs.network
            hsPkgs.parsec
            hsPkgs.time
            hsPkgs.unix
            hsPkgs.random
            hsPkgs.stm
            hsPkgs.SafeSemaphore
          ];
        };
        exes = {
          demo = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.irc
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.parsec
              hsPkgs.time
              hsPkgs.unix
              hsPkgs.random
              hsPkgs.stm
              hsPkgs.SafeSemaphore
            ];
          };
        };
      };
    }