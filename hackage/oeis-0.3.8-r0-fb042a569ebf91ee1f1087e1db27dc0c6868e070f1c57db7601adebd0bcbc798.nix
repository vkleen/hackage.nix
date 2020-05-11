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
    flags = { network-uri = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "oeis"; version = "0.3.8"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Bartosz Nitka <niteria@gmail.com>";
      author = "Brent Yorgey";
      homepage = "";
      url = "";
      synopsis = "Interface to the Online Encyclopedia of Integer Sequences (OEIS)";
      description = "Interface to the <http://oeis.org/ Online Encyclopedia of Integer Sequences (OEIS)>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."base" or (buildDepError "base"))
          ] ++ [
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."network" or (buildDepError "network"))
          ];
        buildable = true;
        };
      tests = {
        "main" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."oeis" or (buildDepError "oeis"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }