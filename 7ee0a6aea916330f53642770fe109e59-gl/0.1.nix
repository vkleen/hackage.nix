{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      usenativewindowslibraries = true;
      useglxgetprocaddress = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "gl";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright © 2014 Edward A. Kmett\nCopyright © 2014 Gabríel Arthúr Pétursson\nCopyright © 2013 Sven Panne";
        maintainer = "ekmett@gmail.com";
        author = "Edward A. Kmett, Gabríel Arthúr Pétursson, Sven Panne";
        homepage = "";
        url = "";
        synopsis = "Complete OpenGL raw bindings";
        description = "Complete OpenGL raw bindings";
        buildType = "Custom";
      };
      components = {
        gl = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.vector
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.hxt
            hsPkgs.split
          ];
          libs = if system.isWindows && _flags.usenativewindowslibraries
            then [ pkgs.opengl32 ]
            else pkgs.lib.optional (!system.isOsx && !system.isIos) pkgs.GL;
          frameworks = if !(system.isWindows && _flags.usenativewindowslibraries) && system.isOsx
            then [ pkgs.OpenGL ]
            else pkgs.lib.optional system.isIos pkgs.OpenGLES;
        };
      };
    }