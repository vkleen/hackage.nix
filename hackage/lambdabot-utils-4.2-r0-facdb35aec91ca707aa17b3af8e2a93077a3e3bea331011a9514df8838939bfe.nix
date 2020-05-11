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
      identifier = { name = "lambdabot-utils"; version = "4.2"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Cale Gibbard <cgibbard@gmail.com>";
      author = "Don Stewart";
      homepage = "http://haskell.org/haskellwiki/Lambdabot";
      url = "";
      synopsis = "Utility libraries for the advanced IRC bot, Lambdabot";
      description = "Lambdabot is an IRC bot written over several years by\nthose on the #haskell IRC channel.\n\nOur own custom libraries for various plugin functions.\n\nAltTime.hs: alternate version of the time library\n\nMiniHTTP.hs: a mini http server\n\nProcess.hs: a wrapper over System.Process\n\nRegex.hsc: a fast packed string regex library\n\nSerial.hs:: a serialisation API\n\nUtil.hs: miscellaneous string, and other, functions";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell-src" or (buildDepError "haskell-src"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      };
    }