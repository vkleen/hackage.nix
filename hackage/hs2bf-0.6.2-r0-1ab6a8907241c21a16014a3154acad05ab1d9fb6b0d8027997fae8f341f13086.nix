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
      identifier = { name = "hs2bf"; version = "0.6.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "xanxys@gmail.com";
      author = "Daiki Handa";
      homepage = "http://www.xanxys.net/hs2bf/";
      url = "";
      synopsis = "Haskell to Brainfuck compiler";
      description = "Proof of concept implementation of Haskell to Brainfuck compiler.\nYou can find examples of compilable codes at <http://www.xanxys.net/public/hs2bf-demo/>";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hs2bf" = {
          depends = [
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."haskell-src" or (buildDepError "haskell-src"))
            ];
          buildable = true;
          };
        };
      };
    }