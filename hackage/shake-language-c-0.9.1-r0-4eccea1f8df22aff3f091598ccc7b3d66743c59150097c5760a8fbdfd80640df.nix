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
      specVersion = "1.8";
      identifier = { name = "shake-language-c"; version = "0.9.1"; };
      license = "Apache-2.0";
      copyright = "Copyright (c) 2012-2016 Samplecount S.L.";
      maintainer = "stefan@samplecount.com";
      author = "";
      homepage = "https://github.com/samplecount/shake-language-c";
      url = "";
      synopsis = "Utilities for cross-compiling with Shake";
      description = "This library provides <http://hackage.haskell.org/package/shake Shake> utilities for cross-compiling @C@, @C++@ and @ObjC@ code for various target platforms. Currently supported target platforms are Android, iOS, Linux, MacOS X, Windows\\/MinGW and Google Portable Native Client (PNaCl). Supported host platforms are MacOS X, Linux and Windows.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."fclabels" or (buildDepError "fclabels"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."shake" or (buildDepError "shake"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."shake-language-c" or (buildDepError "shake-language-c"))
            ];
          buildable = true;
          };
        "spectests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."shake-language-c" or (buildDepError "shake-language-c"))
            ];
          buildable = true;
          };
        };
      };
    }