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
      identifier = { name = "vision"; version = "0.0.3.0"; };
      license = "GPL-3.0-only";
      copyright = "(C) 2010 Oleg Belozeorov";
      maintainer = "Oleg Belozeorov <upwawet@gmail.com>";
      author = "Oleg Belozeorov";
      homepage = "";
      url = "";
      synopsis = "An XMMS2 client.";
      description = "Vision (for the Voice) is an X-platform Music Multiplexing System 2\n(http://xmms2.xmms.se) client aiming to eventually fit its author's\nviews on listening to music, managing a music library etc. Only the\ntime can tell what will come of that :]";
      buildType = "Simple";
      };
    components = {
      exes = {
        "vision" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xmms2-client" or (buildDepError "xmms2-client"))
            (hsPkgs."xmms2-client-glib" or (buildDepError "xmms2-client-glib"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."glib" or (buildDepError "glib"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."MonadCatchIO-mtl" or (buildDepError "MonadCatchIO-mtl"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."url" or (buildDepError "url"))
            ];
          buildable = true;
          };
        };
      };
    }