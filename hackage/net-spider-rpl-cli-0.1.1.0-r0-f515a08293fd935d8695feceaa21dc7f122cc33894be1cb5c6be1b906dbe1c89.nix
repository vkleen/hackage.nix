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
    flags = { static = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "net-spider-rpl-cli"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Toshio Ito <debug.ito@gmail.com>";
      author = "Toshio Ito <debug.ito@gmail.com>";
      homepage = "https://github.com/debug-ito/net-spider";
      url = "";
      synopsis = "CLI executable of NetSpider.RPL.";
      description = "CLI executable of \"NetSpider.RPL\". It's also an example of \"NetSpider.CLI\" module.\n\n__This package is an experimental release. CLI interface and functionality may change drastically in future.__\n\nFor detail, see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."net-spider" or (buildDepError "net-spider"))
          (hsPkgs."net-spider-rpl" or (buildDepError "net-spider-rpl"))
          (hsPkgs."net-spider-cli" or (buildDepError "net-spider-cli"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."greskell" or (buildDepError "greskell"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      exes = {
        "net-spider-rpl-cli" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."net-spider-rpl-cli" or (buildDepError "net-spider-rpl-cli"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."net-spider-rpl-cli" or (buildDepError "net-spider-rpl-cli"))
            (hsPkgs."net-spider" or (buildDepError "net-spider"))
            (hsPkgs."net-spider-rpl" or (buildDepError "net-spider-rpl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."ip" or (buildDepError "ip"))
            ];
          buildable = true;
          };
        };
      };
    }