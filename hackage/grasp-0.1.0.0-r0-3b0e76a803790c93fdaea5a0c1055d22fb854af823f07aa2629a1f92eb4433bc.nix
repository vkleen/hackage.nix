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
      specVersion = "1.10";
      identifier = { name = "grasp"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2015 Jan Mas Rovira";
      maintainer = "janmasrovira@gmail.com";
      author = "Jan Mas Rovira";
      homepage = "https://bitbucket.org/janmasrovira/am3-project/overview";
      url = "";
      synopsis = "GRASP implementation for the AMMM project. ";
      description = "= Brief summary\nThis is part of the final project for the AMMM (MIRI, FIB-UPC) subject.\nIt contains the random instance generator plus all the GRASP part.\n\nIt is hosted at https://bitbucket.org/janmasrovira/am3-project.\n\nThis package includes:\n\n* A polymorphic GRASP implementation.\n* A random instance generator for the AM3 project.\n* The @AM3@ folder contains the code specific to the final project for\nthe Algorithmic Methods for Mathematical Models subject\n(Master in Innovation and Research in Informatics, FIB-UPC).\n\n= Contents\nMake sure to read the documentation of all the modules listed below.\n\nSpecifically, the contents of each module (sorted by relevance to the project) are:\n\n1. \"GRASP\": A polymorphic parameterizable implementation of a Greedy Randomized\nAdaptive Search Procedure (GRASP).\nThe idea is taken from this paper: http://www.optimization-online.org/DB_FILE/2001/09/371.pdf.\nIt does not contain anything that is specific to the AM3 project.\n2. \"AM3.Solution\": Contains all the specific functions to the solution of an\ninstance of the AM3 project.\n3. \"AM3.RandomInstance\": A parameterizable random generator of instances.\n4. \"AM3.Instance\": An instance of the problem. It also provides useful functions that\nhave to do with constructing, querying, importing, exporting... an instance.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."pcre-heavy" or (buildDepError "pcre-heavy"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."turtle" or (buildDepError "turtle"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          ];
        buildable = true;
        };
      exes = {
        "grasp-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."grasp" or (buildDepError "grasp"))
            ];
          buildable = true;
          };
        };
      tests = {
        "grasp-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."grasp" or (buildDepError "grasp"))
            ];
          buildable = true;
          };
        };
      };
    }