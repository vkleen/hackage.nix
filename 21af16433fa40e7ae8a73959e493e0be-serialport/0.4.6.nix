{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "serialport";
          version = "0.4.6";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2009-2011 Joris Putcuyps";
        maintainer = "Joris.Putcuyps@gmail.com";
        author = "Joris Putcuyps";
        homepage = "https://github.com/jputcu/serialport";
        url = "";
        synopsis = "Cross platform serial port library.";
        description = "Cross platform haskell library for using the serial port.";
        buildType = "Simple";
      };
      components = {
        serialport = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ] ++ (if !system.isWindows
            then [ hsPkgs.unix ]
            else [ hsPkgs.Win32 ]);
        };
        tests = {
          Tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.HUnit
              hsPkgs.bytestring
              hsPkgs.serialport
            ];
          };
        };
      };
    }