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
      identifier = { name = "htar"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "2007 Bjorn Bringert <bjorn@bringert.net>\n2008-2012 Duncan Coutts <duncan@community.haskell.org>";
      maintainer = "Duncan Coutts <duncan@community.haskell.org>";
      author = "Bjorn Bringert <bjorn@bringert.net>\nDuncan Coutts <duncan@community.haskell.org>";
      homepage = "";
      url = "";
      synopsis = "Command-line tar archive utility.";
      description = "A Command-line utility to create, extract and list the\ncontents of tar archives. It can work with compressed\narchives using gzip or bzip2 compression.\n\nThis is in part a demo of the @tar@ library but it is also\nusable in place of the ordinary @tar@ program for systems\nlike Windows that do not come with it as standard.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "htar" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."bzlib" or (buildDepError "bzlib"))
            ];
          buildable = true;
          };
        };
      };
    }