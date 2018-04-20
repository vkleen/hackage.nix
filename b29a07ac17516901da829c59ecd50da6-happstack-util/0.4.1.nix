{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      base4 = true;
      tests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "happstack-util";
          version = "0.4.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Happstack team <happs@googlegroups.com>";
        author = "Happstack team, HAppS LLC";
        homepage = "http://happstack.com";
        url = "";
        synopsis = "Web framework";
        description = "Miscellaneous utilities for Happstack packages.";
        buildType = "Simple";
      };
      components = {
        happstack-util = {
          depends  = ([
            hsPkgs.array
            hsPkgs.bytestring
            hsPkgs.directory
            hsPkgs.extensible-exceptions
            hsPkgs.hslogger
            hsPkgs.mtl
            hsPkgs.old-locale
            hsPkgs.old-time
            hsPkgs.parsec
            hsPkgs.process
            hsPkgs.time
            hsPkgs.QuickCheck
            hsPkgs.HUnit
            hsPkgs.random
            hsPkgs.SMTPClient
            hsPkgs.strict-concurrency
            hsPkgs.network
            hsPkgs.template-haskell
            hsPkgs.unix-compat
            hsPkgs.filepath
          ] ++ [
            hsPkgs.base
          ]) ++ pkgs.lib.optional (!system.isWindows) hsPkgs.unix;
        };
        exes = {
          happstack-util-tests = {
            depends  = [
              hsPkgs.HUnit
            ] ++ pkgs.lib.optional _flags.tests hsPkgs.network;
          };
        };
      };
    }