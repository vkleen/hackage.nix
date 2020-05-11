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
    flags = { test = false; };
    package = {
      specVersion = "1.8.0.4";
      identifier = { name = "network-info"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jacob@stanley.io";
      author = "Jacob Stanley";
      homepage = "http://github.com/jystic/network-info";
      url = "";
      synopsis = "Access the local computer's basic network configuration";
      description = "This library provides simple read-only access to the local computer's\nnetworking configuration. It is currently capable of getting a list of\nall the network interfaces and their respective IPv4, IPv6 and MAC\naddresses.\n\nThe executable 'test-network-info' will only be built if the flag 'test'\nhas been set.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        libs = (pkgs.lib).optionals (!system.isLinux) ((pkgs.lib).optional (system.isWindows) (pkgs."iphlpapi" or (sysDepError "iphlpapi")));
        buildable = if system.isLinux
          then true
          else if system.isWindows then true else false;
        };
      exes = {
        "test-network-info" = {
          depends = (pkgs.lib).optionals (flags.test) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network-info" or (buildDepError "network-info"))
            ];
          buildable = if flags.test then true else false;
          };
        };
      };
    }