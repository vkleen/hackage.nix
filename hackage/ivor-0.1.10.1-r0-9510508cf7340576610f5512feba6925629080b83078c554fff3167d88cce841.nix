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
      specVersion = "0";
      identifier = { name = "ivor"; version = "0.1.10.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Edwin Brady <eb@dcs.st-and.ac.uk>";
      author = "Edwin Brady";
      homepage = "http://www.dcs.st-and.ac.uk/~eb/Ivor/";
      url = "";
      synopsis = "Theorem proving library based on dependent type theory";
      description = "Ivor is a type theory based theorem prover, with a\nHaskell API, designed for easy extending and embedding\nof theorem proving technology in Haskell\napplications. It provides an implementation of the\ntype theory and tactics for building terms, more or\nless along the lines of systems such as Coq or Agda,\nand taking much of its inspiration from Conor\nMcBride's presentation of OLEG.\n\nThe API provides a collection of primitive tactics and\ncombinators for building new tactics. It is therefore\npossible to build new tactics to suit specific\napplications. Ivor features a dependent type theory\nsimilar to Luo's ECC with definitions (and similar to\nthat implemented in Epigram), with dependent pattern\nmatching, and experimental multi-stage programming\nsupport. Optionally, it can be extended with\nheterogeneous equality, primitive types and operations,\nnew parser rules, user defined tactics and (if you\nwant your proofs to be untrustworthy) a fixpoint\ncombinator.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."binary" or (buildDepError "binary"))
          ];
        buildable = true;
        };
      };
    }