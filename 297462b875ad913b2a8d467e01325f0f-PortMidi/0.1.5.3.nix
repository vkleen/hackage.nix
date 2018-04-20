{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "PortMidi";
          version = "0.1.5.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Paul H. Liu <paul@thev.net>";
        author = "";
        homepage = "http://github.com/ninegua/PortMidi";
        url = "";
        synopsis = "A binding for PortMedia/PortMidi";
        description = "A Haskell binding for PortMedia/PortMidi";
        buildType = "Simple";
      };
      components = {
        PortMidi = {
          depends  = [ hsPkgs.base ];
          libs = if system.isLinux || system.isFreebsd
            then [ pkgs.asound ]
            else pkgs.lib.optional (!system.isOsx && system.isWindows) pkgs.winmm;
          frameworks = pkgs.lib.optionals (!(system.isLinux || system.isFreebsd) && system.isOsx) [
            pkgs.CoreMIDI
            pkgs.CoreFoundation
            pkgs.CoreAudio
          ];
        };
      };
    }