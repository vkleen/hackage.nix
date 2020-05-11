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
      identifier = { name = "Holumbus-Searchengine"; version = "1.2.1"; };
      license = "MIT";
      copyright = "Copyright (c) 2007 - 2012 Uwe Schmidt, Sebastian M. Gauck and Timo B. Kranz";
      maintainer = "Timo B. Huebel <tbh@holumbus.org>, Uwe Schmidt <uwe@fh-wedel.de>";
      author = "Sebastian M. Gauck, Timo B. Huebel, Uwe Schmidt";
      homepage = "http://holumbus.fh-wedel.de";
      url = "";
      synopsis = "A search and indexing engine.";
      description = "The Holumbus-Searchengine library provides a document indexer\nand crawler to build indexes over document collections\nas well as a sophisticated query interface for these indexes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."bzlib" or (buildDepError "bzlib"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."enummapset" or (buildDepError "enummapset"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."hxt-cache" or (buildDepError "hxt-cache"))
          (hsPkgs."hxt-curl" or (buildDepError "hxt-curl"))
          (hsPkgs."hxt-regex-xmlschema" or (buildDepError "hxt-regex-xmlschema"))
          (hsPkgs."hxt-unicode" or (buildDepError "hxt-unicode"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."unix" or (buildDepError "unix"))
          ] ++ [
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          ];
        buildable = true;
        };
      };
    }