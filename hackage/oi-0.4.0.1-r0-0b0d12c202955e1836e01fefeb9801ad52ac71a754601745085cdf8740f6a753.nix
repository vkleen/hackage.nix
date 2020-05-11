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
      specVersion = "1.14";
      identifier = { name = "oi"; version = "0.4.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nobsun@sampou.org";
      author = "Nobuo Yamashita";
      homepage = "";
      url = "";
      synopsis = "Library for purely functional lazy interactions with the outer world.";
      description = "This package implements a data structure and operations on it for writing interactive program with no imperative flavor of IO monads.\n\n[N.B.] At the moment, APIs maybe change.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          ];
        buildable = true;
        };
      exes = {
        "oi-cats" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-cats2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-echoc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-echo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-morec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-recdircs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        "oi-talk" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."oi" or (buildDepError "oi"))
            ];
          buildable = true;
          };
        };
      };
    }