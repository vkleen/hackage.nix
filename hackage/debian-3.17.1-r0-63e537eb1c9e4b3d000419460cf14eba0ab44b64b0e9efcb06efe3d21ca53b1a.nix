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
      identifier = { name = "debian"; version = "3.17.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "david@seereason.com";
      author = "David Fox";
      homepage = "http://seereason.org/";
      url = "";
      synopsis = "Modules for working with the Debian package system";
      description = "This library includes modules covering almost every aspect of the Debian\npackaging system, including low level data types such as version numbers\nand dependency relations, on up to the types necessary for computing and\ninstalling build dependencies, building source and binary packages,\nand inserting them into a repository.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
          (hsPkgs."Extra" or (buildDepError "Extra"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."bzlib" or (buildDepError "bzlib"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."HaXml" or (buildDepError "HaXml"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          ];
        buildable = true;
        };
      exes = {
        "fakechanges" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."Extra" or (buildDepError "Extra"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."bzlib" or (buildDepError "bzlib"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."HaXml" or (buildDepError "HaXml"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        "debian-report" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."Extra" or (buildDepError "Extra"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."bzlib" or (buildDepError "bzlib"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."HaXml" or (buildDepError "HaXml"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        "debian-versions" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."Extra" or (buildDepError "Extra"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."bzlib" or (buildDepError "bzlib"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."HaXml" or (buildDepError "HaXml"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        "cabal-debian" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."Extra" or (buildDepError "Extra"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."bzlib" or (buildDepError "bzlib"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."HaXml" or (buildDepError "HaXml"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            ];
          buildable = true;
          };
        };
      };
    }