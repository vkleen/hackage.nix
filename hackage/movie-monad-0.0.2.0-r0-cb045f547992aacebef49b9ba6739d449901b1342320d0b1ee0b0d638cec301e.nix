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
      specVersion = "1.10";
      identifier = { name = "movie-monad"; version = "0.0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 David Lettier";
      maintainer = "Lettier";
      author = "Lettier";
      homepage = "https://github.com/lettier/movie-monad";
      url = "";
      synopsis = "Plays videos using GStreamer and GTK+.";
      description = "Desktop video player that uses GStreamer and GTK+.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "movie-monad" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
            (hsPkgs."gi-gobject" or (buildDepError "gi-gobject"))
            (hsPkgs."gi-glib" or (buildDepError "gi-glib"))
            (hsPkgs."gi-gdk" or (buildDepError "gi-gdk"))
            (hsPkgs."gi-gdkpixbuf" or (buildDepError "gi-gdkpixbuf"))
            (hsPkgs."gi-gst" or (buildDepError "gi-gst"))
            (hsPkgs."gi-gstvideo" or (buildDepError "gi-gstvideo"))
            (hsPkgs."gi-gtk" or (buildDepError "gi-gtk"))
            ];
          buildable = true;
          };
        };
      };
    }