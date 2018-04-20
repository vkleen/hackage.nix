{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "supercollider-midi";
          version = "0.1.1";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
        author = "Henning Thielemann <haskell@henning-thielemann.de>";
        homepage = "http://www.haskell.org/haskellwiki/SuperCollider";
        url = "http://darcs.haskell.org/supercollider-midi/";
        synopsis = "Demonstrate how to control SuperCollider via ALSA-MIDI";
        description = "Two small example programs where SuperCollider is controlled by MIDI.\n\n* Control parameters of a wind noise via MIDI controllers\n\n* Use UGens as instruments,\nwhich will be played upon MIDI messages that arrive through ALSA.\nThis way you can play MIDI files using @pmidi@\nor you can use your computer as MIDI expander controlled by a keyboard.";
        buildType = "Simple";
      };
      components = {
        exes = {
          sc-keyboard = {
            depends  = [
              hsPkgs.supercollider-ht
              hsPkgs.hsc3
              hsPkgs.hosc
              hsPkgs.alsa-midi
              hsPkgs.midi
              hsPkgs.event-list
              hsPkgs.non-negative
              hsPkgs.data-accessor
              hsPkgs.mtl
            ] ++ (if _flags.splitbase
              then [
                hsPkgs.base
                hsPkgs.array
                hsPkgs.containers
                hsPkgs.random
              ]
              else [ hsPkgs.base ]);
          };
          sc-wind = {
            depends  = [
              hsPkgs.hsc3
              hsPkgs.hosc
              hsPkgs.alsa-midi
              hsPkgs.midi
              hsPkgs.event-list
              hsPkgs.non-negative
            ] ++ [ hsPkgs.base ];
          };
        };
      };
    }