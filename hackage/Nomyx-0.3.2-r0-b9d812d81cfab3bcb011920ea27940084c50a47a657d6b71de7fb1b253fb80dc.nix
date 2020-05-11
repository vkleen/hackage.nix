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
      identifier = { name = "Nomyx"; version = "0.3.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "corentin.dupont@gmail.com";
      author = "Corentin Dupont";
      homepage = "www.nomyx.net";
      url = "";
      synopsis = "A Nomic game in haskell";
      description = "A Nomic game in Haskell, with a dedicated language to create new rules.\n\nNomyx is a fabulous and strange game where you have the right to change the rules in the middle of the game!\nIndeed, changing the rules is the goal of the game. Changing a rule is considered as a move. Of course even that could be changed! The original (paper) game: www.nomic.net";
      buildType = "Simple";
      };
    components = {
      exes = {
        "Nomyx" = {
          depends = [
            (hsPkgs."Nomyx-Language" or (buildDepError "Nomyx-Language"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."DebugTraceHelpers" or (buildDepError "DebugTraceHelpers"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."MonadCatchIO-mtl" or (buildDepError "MonadCatchIO-mtl"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-accessor-transformers" or (buildDepError "data-accessor-transformers"))
            (hsPkgs."data-lens" or (buildDepError "data-lens"))
            (hsPkgs."data-lens-fd" or (buildDepError "data-lens-fd"))
            (hsPkgs."data-lens-template" or (buildDepError "data-lens-template"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."eprocess" or (buildDepError "eprocess"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."fb" or (buildDepError "fb"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hdaemonize" or (buildDepError "hdaemonize"))
            (hsPkgs."hint" or (buildDepError "hint"))
            (hsPkgs."hint-server" or (buildDepError "hint-server"))
            (hsPkgs."hscolour" or (buildDepError "hscolour"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."ixset" or (buildDepError "ixset"))
            (hsPkgs."lenses" or (buildDepError "lenses"))
            (hsPkgs."mime-mail" or (buildDepError "mime-mail"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."mueval" or (buildDepError "mueval"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."acid-state" or (buildDepError "acid-state"))
            (hsPkgs."happstack-authenticate" or (buildDepError "happstack-authenticate"))
            (hsPkgs."happstack-server" or (buildDepError "happstack-server"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."reform" or (buildDepError "reform"))
            (hsPkgs."reform-blaze" or (buildDepError "reform-blaze"))
            (hsPkgs."reform-happstack" or (buildDepError "reform-happstack"))
            (hsPkgs."web-routes" or (buildDepError "web-routes"))
            (hsPkgs."web-routes-happstack" or (buildDepError "web-routes-happstack"))
            (hsPkgs."web-routes-regular" or (buildDepError "web-routes-regular"))
            (hsPkgs."web-routes-th" or (buildDepError "web-routes-th"))
            (hsPkgs."regular" or (buildDepError "regular"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."safecopy" or (buildDepError "safecopy"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            ];
          buildable = true;
          };
        };
      };
    }