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
    flags = { enable-examples = false; enable-doctests = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "libstackexchange"; version = "0.3.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "matvey.aksenov@gmail.com";
      author = "Matvey Aksenov, Dmitry Malikov";
      homepage = "https://github.com/supki/libstackexchange";
      url = "";
      synopsis = "StackExchange API interface";
      description = "Provides interface for StackExchange v2.1 API";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "rep-watcher" = {
          depends = [
            (hsPkgs."aeson-lens" or (buildDepError "aeson-lens"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."libstackexchange" or (buildDepError "libstackexchange"))
            ];
          buildable = if !flags.enable-examples then false else true;
          };
        "badges-watcher" = {
          depends = [
            (hsPkgs."aeson-lens" or (buildDepError "aeson-lens"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."libstackexchange" or (buildDepError "libstackexchange"))
            ];
          buildable = if !flags.enable-examples then false else true;
          };
        "server-side-authentication" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."happstack-server" or (buildDepError "happstack-server"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."libstackexchange" or (buildDepError "libstackexchange"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = if !flags.enable-examples then false else true;
          };
        };
      tests = {
        "api" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."libstackexchange" or (buildDepError "libstackexchange"))
            ];
          buildable = if !flags.enable-doctests then false else true;
          };
        };
      };
    }