let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.2";
      identifier = { name = "zmidi-core"; version = "0.7.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Read and write MIDI files.";
      description = "\nMinimalist library to read and write MIDI files, with\ndependencies only on ByteString, Containers and Data.Binary.\n\nChangelog:\n\nv0.6.0 to v0.7.0:\n\n* Changed @ChannelPrefix@ constructor to have a single\nargument - channel number (previously it stored a constant\ntag 0x01 as well as channel number).\n\n* Added @SysExCont@ and @SysExEscape@ constructors to the\n@MidiSysExEvent@ data type.\n\n* Added new pretty printers - @Csv@ based on @midicsv@ and\n@Ascii@ based on the ASCII MIDI representation in the book\nBeyond Midi (the zmidi ASCII representation is simplified).\nThe demo application @MidiPrint@ now allows choice of pretty\nprinter.\n\n* @printMidiHeader@ and @printMidiTrack@ from @Pretty@ changed\nto MidiFiles as arguments, @printMidi@ has now become\n@putMidi@.\n\nv0.5.0 to v0.6.0:\n\n* Extended the parser and changed the syntax tree to interpret\nMIDI Running Status.\n\n* Added a module @ZMidi.Core.Canonical@ to translate MidiFiles\nto a canonical form where any shorthand NoteOff introduced by\nRunning Status is expanded to regular NoteOn and NoteOff\nevents (with Running Status set, MidiFiles can signal NoteOff\nevents as another NoteOn with 0 channel velocity).\n\n* Added a hack to the pretty printer to stop printing ASCII\nchars greater than 164 causing an error when printing to\nstdout.\n\nFor older changes see - CHANGES file.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."binary" or (buildDepError "binary"))
          ];
        buildable = true;
        };
      };
    }