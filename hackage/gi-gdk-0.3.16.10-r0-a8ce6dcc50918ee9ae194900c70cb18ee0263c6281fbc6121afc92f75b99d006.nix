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
      identifier = { name = "gi-gdk"; version = "0.3.16.10"; };
      license = "LGPL-2.1-only";
      copyright = "";
      maintainer = "Iñaki García Etxebarria (garetxe@gmail.com)";
      author = "Will Thompson, Iñaki García Etxebarria and Jonas Platte";
      homepage = "https://github.com/haskell-gi/haskell-gi";
      url = "";
      synopsis = "Gdk bindings";
      description = "Bindings for Gdk, autogenerated by haskell-gi.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
          (hsPkgs."gi-glib" or (buildDepError "gi-glib"))
          (hsPkgs."gi-gobject" or (buildDepError "gi-gobject"))
          (hsPkgs."gi-gdkpixbuf" or (buildDepError "gi-gdkpixbuf"))
          (hsPkgs."gi-gio" or (buildDepError "gi-gio"))
          (hsPkgs."gi-pango" or (buildDepError "gi-pango"))
          (hsPkgs."gi-cairo" or (buildDepError "gi-cairo"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        pkgconfig = [ (pkgconfPkgs."gdk-3.0" or (pkgConfDepError "gdk-3.0")) ];
        buildable = true;
        };
      };
    }