{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8.0.2";
        identifier = {
          name = "pipes-concurrency";
          version = "1.2.0";
        };
        license = "BSD-3-Clause";
        copyright = "2013 Gabriel Gonzalez";
        maintainer = "Gabriel439@gmail.com";
        author = "Gabriel Gonzalez";
        homepage = "";
        url = "";
        synopsis = "Concurrency for the pipes ecosystem";
        description = "This library provides light-weight concurrency primitives for\npipes, with the following features:\n\n* /Simple API/: Use only five functions\n\n* /Deadlock Safety/: Automatically avoid concurrency deadlocks\n\n* /Flexibility/: Build many-to-many and cyclic communication topologies\n\n* /Dynamic Graphs/: Add or remove readers and writers at any time\n\nImport \"Control.Proxy.Concurrent\" to use the library.\n\nRead \"Control.Proxy.Concurrent.Tutorial\" for an tutorial.";
        buildType = "Simple";
      };
      components = {
        pipes-concurrency = {
          depends  = [
            hsPkgs.base
            hsPkgs.pipes
            hsPkgs.stm
          ];
        };
      };
    }