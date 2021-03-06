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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "prof2dot"; version = "0.4.1"; };
      license = "BSD-3-Clause";
      copyright = "2007, 2008 Antiope Associates LLC";
      maintainer = "gwright@antiope.com";
      author = "Gregory Wright";
      homepage = "http://antiope.com/downloads.html";
      url = "";
      synopsis = "Convert GHC profiles into GraphViz's dot format";
      description = "prof2dot takes profiling information (a file generated by running\na ghc-compiled application with the +RTS -px -RTS flags) and converts it to\nGraphViz's dot format.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "prof2dot" = {
          depends = [
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ] ++ (if flags.splitbase
            then [
              (hsPkgs."base" or (buildDepError "base"))
              (hsPkgs."containers" or (buildDepError "containers"))
              ]
            else [ (hsPkgs."base" or (buildDepError "base")) ]);
          buildable = true;
          };
        };
      };
    }