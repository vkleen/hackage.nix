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
      specVersion = "1.6";
      identifier = { name = "gnomevfs"; version = "0.11.0"; };
      license = "LicenseRef-GPL";
      copyright = "(c) 2001-2010 The Gtk2Hs Team";
      maintainer = "gtk2hs-users@sourceforge.net";
      author = "Duncan Coutts";
      homepage = "http://www.haskell.org/gtk2hs/";
      url = "";
      synopsis = "Binding to the GNOME Virtual File System library.";
      description = "GNOME VFS is the GNOME virtual file system.  It is the foundation of the\nNautilus file manager.  It provides a modular architecture and ships with\nseveral modules that implement support for local files, http, ftp and others.\nIt provides an URI-based API, a backend supporting asynchronous file\noperations, a MIME type manipulation library and other features.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."glib" or (buildDepError "glib"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          ];
        pkgconfig = [
          (pkgconfPkgs."gnome-vfs-2.0" or (pkgConfDepError "gnome-vfs-2.0"))
          (pkgconfPkgs."gnome-vfs-module-2.0" or (pkgConfDepError "gnome-vfs-module-2.0"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.gtk2hsC2hs or (pkgs.buildPackages.gtk2hsC2hs or (buildToolDepError "gtk2hsC2hs")))
          (hsPkgs.buildPackages.gtk2hsHookGenerator or (pkgs.buildPackages.gtk2hsHookGenerator or (buildToolDepError "gtk2hsHookGenerator")))
          (hsPkgs.buildPackages.gtk2hsTypeGen or (pkgs.buildPackages.gtk2hsTypeGen or (buildToolDepError "gtk2hsTypeGen")))
          ];
        buildable = true;
        };
      };
    }