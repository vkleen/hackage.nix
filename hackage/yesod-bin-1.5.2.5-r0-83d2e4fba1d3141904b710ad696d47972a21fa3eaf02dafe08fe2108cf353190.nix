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
      identifier = { name = "yesod-bin"; version = "1.5.2.5"; };
      license = "MIT";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman <michael@snoyman.com>";
      homepage = "http://www.yesodweb.com/";
      url = "";
      synopsis = "The yesod helper executable.";
      description = "See README.md for more information";
      buildType = "Simple";
      };
    components = {
      exes = {
        "yesod" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."http-reverse-proxy" or (buildDepError "http-reverse-proxy"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."project-template" or (buildDepError "project-template"))
            (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
            (hsPkgs."say" or (buildDepError "say"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."streaming-commons" or (buildDepError "streaming-commons"))
            (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."typed-process" or (buildDepError "typed-process"))
            ];
          buildable = true;
          };
        };
      };
    }