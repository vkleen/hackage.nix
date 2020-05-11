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
      specVersion = "1.2";
      identifier = { name = "nikepub"; version = "1.1.2"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "uwe@codemanic.com";
      author = "Uwe Hoffmann";
      homepage = "http://www.codemanic.com/uwe";
      url = "";
      synopsis = "Command line utility publishes Nike+ runs on blogs and Twitter";
      description = "Simple commandline program that given a Nike+ user id will fetch the\nmost recent Nike+ run and publish it to any blog and/or Twitter account.\nAssumes the Nike+ user profile is public. Supports customizable templates\nfor the blog entry title, body and Twitter status update. Any blogging\nsystem with XML-RPC support for metaWeblog.newPost\n(like WordPress or MovableType) is supported.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "nikepub" = {
          depends = [
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."GoogleChart" or (buildDepError "GoogleChart"))
            (hsPkgs."haxr" or (buildDepError "haxr"))
            (hsPkgs."hxt" or (buildDepError "hxt"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."hs-twitter" or (buildDepError "hs-twitter"))
            (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
            ];
          buildable = true;
          };
        };
      };
    }