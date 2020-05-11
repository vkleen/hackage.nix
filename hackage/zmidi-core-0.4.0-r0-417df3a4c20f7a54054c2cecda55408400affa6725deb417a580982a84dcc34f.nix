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
      identifier = { name = "zmidi-core"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Read and write MIDI files.";
      description = "\nMinimalist library to read and write MIDI files, with\ndependencies only on ByteString and Data.Binary.\n\nChangelog:\n\nv0.3.0 to v0.4.0:\n\n* Added new constructors to @MidiMetaEvent@ for MidiPort and\nMetaOther. MetaOther recognizes otherwise unrecognized events\nimproving the robustness of the parser. Similarly a new\n/other/ constructor has been added to @MidiScaleType@ to\navoid parse errors.\n\nv0.2.1 to v0.3.0:\n\n* Revised naming of the MIDI data types. All data types now have\nthe prefix Midi (previously only MidiFile followed this scheme).\nThe rationale for this is client software, that might want a\nhigher-level representation, is then free to use the more\ngeneric names Track, Message, etc.\n\n* @DeltaTime@ made a newtype wrapper rather than a type synonym.\n\n* Renamed the pretty print functions @track@ to @printMidiTrack@\nand @header@ to @printMidiHeader@.\n\n* Moved internal dataypes (SplitByte, Varlen) into a private\nmodule.\n\nv0.2.0 to v0.2.1:\n\n* Added Show class constraints to various type signatures to\naccommodate changes to Num superclass hierarchy in GHC 7.4.\nThanks to Remy Moueza for the patches.\n\nv0.1.0 to v0.2.0:\n\n* Added a top-level /shim/ module to import all the exposed\nmodules. Added a version number module\n\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."binary" or (buildDepError "binary"))
          ];
        buildable = true;
        };
      };
    }