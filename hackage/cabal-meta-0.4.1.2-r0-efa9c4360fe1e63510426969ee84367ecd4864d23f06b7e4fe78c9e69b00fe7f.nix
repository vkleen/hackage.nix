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
    flags = { ghc7 = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "cabal-meta"; version = "0.4.1.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Greg Weber <greg@gregweber.info>";
      author = "Greg Weber <greg@gregweber.info>";
      homepage = "http://www.yesodweb.com/";
      url = "";
      synopsis = "build multiple packages at once";
      description = "see: <http://www.yesodweb.com/blog/2012/04/cabal-meta> and <http://github.com/yesodweb/cabal-meta>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."shelly" or (buildDepError "shelly"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      exes = {
        "cabal-meta" = {
          depends = [
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
            ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."shelly" or (buildDepError "shelly"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            ];
          buildable = true;
          };
        };
      };
    }