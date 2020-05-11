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
      dev = false;
      library-only = false;
      oldtime = false;
      threaded = true;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "hledger-web"; version = "1.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Simon Michael <simon@joyful.com>";
      author = "Simon Michael <simon@joyful.com>";
      homepage = "http://hledger.org";
      url = "";
      synopsis = "Web interface for the hledger accounting tool";
      description = "This is hledger's web interface.\nIt provides a more user-friendly and collaborative UI than the\ncommand-line or curses-style interfaces.\n\nhledger is a cross-platform program for tracking money, time, or\nany other commodity, using double-entry accounting and a simple,\neditable file format. It is inspired by and largely compatible\nwith ledger(1).  hledger provides command-line, curses and web\ninterfaces, and aims to be a reliable, practical tool for daily\nuse.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
          (hsPkgs."hledger" or (buildDepError "hledger"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."clientsession" or (buildDepError "clientsession"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."wai-handler-launch" or (buildDepError "wai-handler-launch"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."yesod" or (buildDepError "yesod"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
          (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
          (hsPkgs."json" or (buildDepError "json"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ] ++ (if flags.oldtime
          then [
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            ]
          else [
            (hsPkgs."time" or (buildDepError "time"))
            ])) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      exes = {
        "hledger-web" = {
          depends = ([
            (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
            (hsPkgs."hledger" or (buildDepError "hledger"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."clientsession" or (buildDepError "clientsession"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-handler-launch" or (buildDepError "wai-handler-launch"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
            (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."hledger-web" or (buildDepError "hledger-web"))
            ] ++ (if flags.oldtime
            then [
              (hsPkgs."time" or (buildDepError "time"))
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              ]
            else [
              (hsPkgs."time" or (buildDepError "time"))
              ])) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
          buildable = if flags.library-only then false else true;
          };
        };
      tests = {
        "test" = {
          depends = ([
            (hsPkgs."hledger-lib" or (buildDepError "hledger-lib"))
            (hsPkgs."hledger" or (buildDepError "hledger"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."clientsession" or (buildDepError "clientsession"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-handler-launch" or (buildDepError "wai-handler-launch"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
            (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."hledger-web" or (buildDepError "hledger-web"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
            ] ++ (if flags.oldtime
            then [
              (hsPkgs."time" or (buildDepError "time"))
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              ]
            else [
              (hsPkgs."time" or (buildDepError "time"))
              ])) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
          buildable = true;
          };
        };
      };
    }