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
      identifier = { name = "hackage2twitter"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Tom Lokhorst <tom@lokhorst.eu>";
      author = "Tom Lokhorst";
      homepage = "http://github.com/tomlokhorst/hackage2twitter";
      url = "";
      synopsis = "Send new Hackage releases to Twitter";
      description = "Build on the `feed2twitter` library, this program reads\nthe Hackage RSS feed and tweets each new release to\nTwitter.\n\nThe Hackage feed is read only once. To keep updating, call\nthis program every few minutes in a cron job.\n\nA local cache of the last 20 tweets is kept in a file to\nmake sure no duplicates are sent.\n\nUsage:\n\n> \$ hackage2twitter username password cache-file [--debug-mode]";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hackage2twitter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."feed" or (buildDepError "feed"))
            (hsPkgs."feed2twitter" or (buildDepError "feed2twitter"))
            ];
          buildable = true;
          };
        };
      };
    }