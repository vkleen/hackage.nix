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
    flags = {
      server = false;
      snap = false;
      warp = true;
      tfrandom = true;
      official = false;
      th = true;
      jsaddle = false;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "hanabi-dealer"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Susumu Katayama <skata@cs.miyazaki-u.ac.jp>";
      author = "Susumu Katayama";
      homepage = "http://nautilus.cs.miyazaki-u.ac.jp/~skata/Sontakki/";
      url = "";
      synopsis = "Hanabi card game";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."random" or (buildDepError "random"))
          ] ++ (pkgs.lib).optionals (compiler.isGhcjs && true || flags.jsaddle || flags.server) ((pkgs.lib).optional (flags.th) (hsPkgs."template-haskell" or (buildDepError "template-haskell")))) ++ (pkgs.lib).optionals (!(compiler.isGhcjs && true) && flags.server) (([
          (hsPkgs."websockets" or (buildDepError "websockets"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ] ++ (pkgs.lib).optional (flags.tfrandom) (hsPkgs."tf-random" or (buildDepError "tf-random"))) ++ (if flags.snap
          then [
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."websockets-snap" or (buildDepError "websockets-snap"))
            (hsPkgs."snap-server" or (buildDepError "snap-server"))
            (hsPkgs."abstract-par" or (buildDepError "abstract-par"))
            (hsPkgs."monad-par" or (buildDepError "monad-par"))
            ]
          else (pkgs.lib).optionals (flags.warp) [
            (hsPkgs."wai-websockets" or (buildDepError "wai-websockets"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            ]))) ++ (pkgs.lib).optionals (compiler.isGhcjs && true || flags.jsaddle) [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."jsaddle-warp" or (buildDepError "jsaddle-warp"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."miso" or (buildDepError "miso"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      exes = {
        "server" = {
          depends = (pkgs.lib).optionals (!(compiler.isGhcjs && true || !flags.server)) ((([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."websockets" or (buildDepError "websockets"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."hanabi-dealer" or (buildDepError "hanabi-dealer"))
            ] ++ (pkgs.lib).optional (flags.th) (hsPkgs."template-haskell" or (buildDepError "template-haskell"))) ++ (pkgs.lib).optional (flags.tfrandom) (hsPkgs."tf-random" or (buildDepError "tf-random"))) ++ (if flags.snap
            then [
              (hsPkgs."unix" or (buildDepError "unix"))
              (hsPkgs."websockets-snap" or (buildDepError "websockets-snap"))
              (hsPkgs."snap-server" or (buildDepError "snap-server"))
              (hsPkgs."abstract-par" or (buildDepError "abstract-par"))
              (hsPkgs."monad-par" or (buildDepError "monad-par"))
              ]
            else (pkgs.lib).optionals (flags.warp) [
              (hsPkgs."wai-websockets" or (buildDepError "wai-websockets"))
              (hsPkgs."warp" or (buildDepError "warp"))
              (hsPkgs."wai" or (buildDepError "wai"))
              (hsPkgs."http-types" or (buildDepError "http-types"))
              ]));
          buildable = if compiler.isGhcjs && true || !flags.server
            then false
            else true;
          };
        "client" = {
          depends = (pkgs.lib).optionals (!(!(compiler.isGhcjs && true) && !flags.jsaddle)) ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."jsaddle-warp" or (buildDepError "jsaddle-warp"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."miso" or (buildDepError "miso"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."hanabi-dealer" or (buildDepError "hanabi-dealer"))
            ] ++ (pkgs.lib).optional (flags.th) (hsPkgs."template-haskell" or (buildDepError "template-haskell")));
          buildable = if !(compiler.isGhcjs && true) && !flags.jsaddle
            then false
            else true;
          };
        };
      };
    }