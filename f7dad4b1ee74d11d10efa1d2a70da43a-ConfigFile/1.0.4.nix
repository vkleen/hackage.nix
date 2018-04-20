{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "ConfigFile";
          version = "1.0.4";
        };
        license = "LicenseRef-LGPL";
        copyright = "Copyright (c) 2004-2008 John Goerzen";
        maintainer = "John Goerzen <jgoerzen@complete.org>";
        author = "John Goerzen";
        homepage = "http://software.complete.org/configfile";
        url = "";
        synopsis = "Configuration file reading & writing";
        description = "Parser and writer for handling sectioned config files in\nHaskell.\n\nThe ConfigFile module works with configuration files in a standard\nformat that is easy for the user to edit, easy for the programmer\nto work with, yet remains powerful and flexible.  It is inspired by,\nand compatible with, Python's ConfigParser module.  It uses files\nthat resemble Windows .INI-style files, but with numerous\nimprovements.\n\nConfigFile provides simple calls to both read and write config files.\nIt's possible to make a config file parsable by this module,\nthe Unix shell, and make.";
        buildType = "Custom";
      };
      components = {
        ConfigFile = {
          depends  = [
            hsPkgs.parsec
            hsPkgs.base
            hsPkgs.haskell98
            hsPkgs.mtl
            hsPkgs.MissingH
            hsPkgs.containers
          ];
        };
        exes = {
          runtests = {
            depends  = [
              hsPkgs.parsec
              hsPkgs.base
              hsPkgs.haskell98
              hsPkgs.mtl
              hsPkgs.MissingH
              hsPkgs.containers
            ];
          };
        };
      };
    }