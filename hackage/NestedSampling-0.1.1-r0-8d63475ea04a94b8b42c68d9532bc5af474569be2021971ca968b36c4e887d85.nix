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
      identifier = { name = "NestedSampling"; version = "0.1.1"; };
      license = "GPL-2.0-only";
      copyright = "(C) Sivia, Skilling 2006, Trotts 2011";
      maintainer = "issac.trotts@gmail.com";
      author = "Issac Trotts";
      homepage = "https://github.com/ijt/haskell_nested_sampling";
      url = "";
      synopsis = "A port of John Skilling's nested sampling C code to Haskell.";
      description = "Nested Sampling is a numerical algorithm for approximate Bayesian\ninference. It generates samples from the posterior\ndistribution but its main purpose is to estimate the\nevidence P(M|D) of the model conditioned on the observed\ndata. More information on Nested Sampling is available\nat http://en.wikipedia.org/wiki/Nested_sampling_algorithm.\nThe original code can be found at\nhttp://www.inference.phy.cam.ac.uk/bayesys/sivia/\nalong with documentation at\nhttp://www.inference.phy.cam.ac.uk/bayesys/.\nAn example program called lighthouse.hs is included.\nSo far, only the simple demonstration file called mininest.c\nhas been ported. There is a more sophisticated C library\navailable at\nhttp://www.inference.phy.cam.ac.uk/bayesys/nest/nest.tar.gz\nbut it has not been ported to Haskell yet.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      exes = {
        "lighthouse" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."NestedSampling" or (buildDepError "NestedSampling"))
            ];
          buildable = true;
          };
        };
      };
    }