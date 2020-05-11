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
    flags = { buildtests = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "LDAP"; version = "0.6.11"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2005-2017 John Goerzen, Edward Z. Yang";
      maintainer = "Edward Z. Yang <ezyang@mit.edu>";
      author = "John Goerzen, Edward Z. Yang";
      homepage = "https://github.com/ezyang/ldap-haskell";
      url = "";
      synopsis = "Haskell binding for C LDAP API";
      description = "This package provides LDAP interface code for Haskell programs,\nbinding to the C LDAP API.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        libs = [
          (pkgs."ldap" or (sysDepError "ldap"))
          (pkgs."lber" or (sysDepError "lber"))
          ];
        buildable = true;
        };
      exes = {
        "runtests" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = if flags.buildtests then true else false;
          };
        };
      tests = {
        "test-ldap" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."LDAP" or (buildDepError "LDAP"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          libs = [
            (pkgs."ldap" or (sysDepError "ldap"))
            (pkgs."lber" or (sysDepError "lber"))
            ];
          buildable = true;
          };
        };
      };
    }