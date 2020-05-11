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
      identifier = { name = "linkchk"; version = "0.0.2"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Jens-Ulrik Petersen <juhp@01.246.ne.jp>";
      author = "Jens-Ulrik Petersen";
      homepage = "http://www.haskell.org/~petersen/haskell/linkchk/";
      url = "";
      synopsis = "linkchk is a network interface link ping monitor.";
      description = "It supports both IPv4 and IPv6. It works by monitoring\nthe routing table and pinging the gateway (next hop)\nof a network interface. When the link is up and functioning\nthe ping time is displayed in a small gtk window, otherwise\nthe link status is displayed. linkchk can also run in a tty.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "linkchk" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."popenhs" or (buildDepError "popenhs"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            ];
          buildable = true;
          };
        };
      };
    }