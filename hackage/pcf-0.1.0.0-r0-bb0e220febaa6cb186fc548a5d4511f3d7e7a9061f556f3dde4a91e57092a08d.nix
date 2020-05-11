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
      identifier = { name = "pcf"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "jozefg@cmu.edu";
      author = "Danny Gratzer";
      homepage = "";
      url = "";
      synopsis = "A one file compiler for PCF";
      description = "PCF is a small programming language with higher order\nfunctions, natural numbers, and recursion. It is\nstatically tpyed and turing complete (general\nrecursion and all that). This compiler transformers\na PCF expression into a file of C code that when run\noutputs the answer.\nIt is mostly intended as a\ndemonstration of how to write such a compiler. The\ncurious reader should look at the <http://jozefg.bitbucket.org/posts/2015-03-24-pcf.html writeup>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bound" or (buildDepError "bound"))
          (hsPkgs."c-dsl" or (buildDepError "c-dsl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."monad-gen" or (buildDepError "monad-gen"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."prelude-extras" or (buildDepError "prelude-extras"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."void" or (buildDepError "void"))
          ];
        buildable = true;
        };
      };
    }