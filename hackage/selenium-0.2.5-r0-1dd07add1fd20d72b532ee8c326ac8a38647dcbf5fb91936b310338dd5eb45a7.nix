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
    flags = { small_base = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "selenium"; version = "0.2.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Aaron Tomb <atomb@galois.com>";
      author = "Aaron Tomb <atomb@galois.com>";
      homepage = "";
      url = "";
      synopsis = "Test web applications through a browser.";
      description = "NOTE: This package is considered deprecated as of April\n2012. The 'webdriver' package on Hackage is more complete\nand uses the more modern WebDriver protocol used by\nrecent Selenium versions.\nHaskell bindings to communicate with a Selenium Remote\nControl server. This package makes it possible to use\nHaskell to write test scripts that exercise web\napplications through a web browser.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.small_base
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
        buildable = true;
        };
      };
    }