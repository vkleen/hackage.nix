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
      specVersion = "0";
      identifier = { name = "hsmagick"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) Tim Chevalier, 2008";
      maintainer = "chevalier@alum.wellesley.edu";
      author = "Tim Chevalier";
      homepage = "http://community.haskell.org/~tim";
      url = "";
      synopsis = "FFI bindings for the GraphicsMagick library";
      description = "FFI bindings for the GraphicsMagick library";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          ];
        libs = [
          (pkgs."tiff" or (sysDepError "tiff"))
          (pkgs."jasper" or (sysDepError "jasper"))
          (pkgs."jpeg" or (sysDepError "jpeg"))
          (pkgs."png" or (sysDepError "png"))
          (pkgs."wmflite" or (sysDepError "wmflite"))
          (pkgs."bz2" or (sysDepError "bz2"))
          (pkgs."z" or (sysDepError "z"))
          (pkgs."m" or (sysDepError "m"))
          (pkgs."pthread" or (sysDepError "pthread"))
          ];
        pkgconfig = [
          (pkgconfPkgs."GraphicsMagick" or (pkgConfDepError "GraphicsMagick"))
          (pkgconfPkgs."lcms" or (pkgConfDepError "lcms"))
          (pkgconfPkgs."freetype2" or (pkgConfDepError "freetype2"))
          (pkgconfPkgs."sm" or (pkgConfDepError "sm"))
          (pkgconfPkgs."ice" or (pkgConfDepError "ice"))
          (pkgconfPkgs."x11" or (pkgConfDepError "x11"))
          (pkgconfPkgs."libxml-2.0" or (pkgConfDepError "libxml-2.0"))
          ];
        buildable = true;
        };
      };
    }