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
      identifier = { name = "xdcc"; version = "1.1.3"; };
      license = "MIT";
      copyright = "";
      maintainer = "git@jangerlinger.de";
      author = "Jan Gerlinger";
      homepage = "https://github.com/JanGe/xdcc";
      url = "";
      synopsis = "A wget-like utility for retrieving files from XDCC bots on\nIRC";
      description = "XDCC (eXtended DCC) is a protocol used by IRC bots to make\nfiles available for transfer. This utility can be used to\nretrieve such files.\n\nSee <https://github.com/JanGe/xdcc/blob/master/README.md>\nfor usage instructions.\n\nSee <https://de.wikipedia.org/wiki/XDCC> for\nmore details.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "xdcc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ascii-progress" or (buildDepError "ascii-progress"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."concurrent-output" or (buildDepError "concurrent-output"))
            (hsPkgs."errors" or (buildDepError "errors"))
            (hsPkgs."iproute" or (buildDepError "iproute"))
            (hsPkgs."irc-client" or (buildDepError "irc-client"))
            (hsPkgs."irc-dcc" or (buildDepError "irc-dcc"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."path" or (buildDepError "path"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
            (hsPkgs."signal" or (buildDepError "signal"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
            ];
          buildable = true;
          };
        };
      };
    }