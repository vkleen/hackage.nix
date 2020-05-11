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
      identifier = { name = "bindings-sc3"; version = "0.4.1"; };
      license = "LicenseRef-GPL";
      copyright = "Copyright (c) Stefan Kersten 2010-2012";
      maintainer = "Stefan Kersten <sk@k-hornz.de>";
      author = "Stefan Kersten <sk@k-hornz.de>";
      homepage = "https://github.com/kaoskorobase/bindings-sc3/";
      url = "";
      synopsis = "Low-level bindings to the SuperCollider synthesis engine library.";
      description = "DEPRECATED. This library is looking for a new maintainer.\n\nThis library provides low level bindings to the SuperCollider synthesis\nengine library (@libscsynth@). If you are looking for a higher level\nHaskell interface, please use the /hsc3-process/ package\n(<http://hackage.haskell.org/package/hsc3-process>).\n\nChangeLog: <https://github.com/kaoskorobase/bindings-sc3/blob/master/ChangeLog.md>\n\nIn order to use this package, you need to build the dynamic library version\nof SuperCollider <supercollider.sourceforge.net> by passing\n@-DLIBSCSYNTH=ON@ to @cmake@ and put it in a location where it can be found by the\nlinker (e.g. @/usr/local/lib@ on Unix systems, alternatively use the @--extra-lib-dirs@\nflag of @cabal configure@).\n\nThe required SuperCollider version is 3.5.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          ];
        libs = [ (pkgs."scsynth" or (sysDepError "scsynth")) ];
        buildable = true;
        };
      };
    }