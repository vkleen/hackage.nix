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
      identifier = { name = "mighttpd2"; version = "2.3.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>";
      homepage = "http://www.mew.org/~kazu/proj/mighttpd/";
      url = "";
      synopsis = "A classical web server on WAI/warp";
      description = "A classical web server on WAI/warp.\nStatic files and CGI can be handled.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "mighty" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."unix-bytestring" or (buildDepError "unix-bytestring"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."wai-app-file-cgi" or (buildDepError "wai-app-file-cgi"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."http-date" or (buildDepError "http-date"))
            (hsPkgs."hashmap" or (buildDepError "hashmap"))
            ];
          buildable = true;
          };
        "mkindex" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }