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
    flags = { maintainer = false; test-doctest = true; };
    package = {
      specVersion = "1.18";
      identifier = { name = "playlists"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2013-2016 Peter Jones";
      maintainer = "Peter Jones <pjones@devalot.com>";
      author = "Peter Jones <pjones@devalot.com>";
      homepage = "https://github.com/pjones/playlists";
      url = "";
      synopsis = "Library and executable for working with playlist files.";
      description = "Playlists is a library for working with media playlist files.  The\noriginal motivation for the library was extracting URLs for\nstreaming radio stations that use PLS and M3U playlist files.\n\nThe package also includes an executable that can dump the URLs from\na playlist file and convert between playlist file formats.\n\n/Example:/\n\n> import qualified Data.ByteString as BS\n> import Text.Playlist\n>\n> readPlaylist :: Format -> IO Playlist\n> readPlaylist fmt = do\n>   content <- BS.getContents\n>   case parsePlaylist fmt content of\n>     Left err -> fail \$ \"failed to parse playlist on stdin: \" ++ err\n>     Right x  -> return x\n\n/Playlist Executable Examples:/\n\n> \$ playlist urls --format PLS < somefile.pls\n>\n> \$ playlist convert --from PLS --to M3U < somefile.pls";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."word8" or (buildDepError "word8"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          ];
        buildable = true;
        };
      exes = {
        "playlist" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."playlists" or (buildDepError "playlists"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."playlists" or (buildDepError "playlists"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "doctests" = {
          depends = (pkgs.lib).optionals (!(!flags.test-doctest)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = if !flags.test-doctest then false else true;
          };
        };
      };
    }