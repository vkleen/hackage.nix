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
      specVersion = "1.6";
      identifier = { name = "berp"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2010 Bernard James Pope";
      maintainer = "florbitous@gmail.com ";
      author = "Bernard James Pope (Bernie Pope)";
      homepage = "http://wiki.github.com/bjpop/berp/  ";
      url = "";
      synopsis = "An implementation of Python 3. ";
      description = "Berp is an implementation of Python 3, written in Haskell.\nIt provides a compiler and an interpreter. In both cases\nthe input Python program is translated into Haskell code.\nThe compiler turns the Haskell code into machine code.\nThe interpreter runs the Haskell code immediately via\nthe GHCi interpreter. The user interface of the interpreter\nimitates the one provided by CPython.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      exes = {
        "berp" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."language-python" or (buildDepError "language-python"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."parseargs" or (buildDepError "parseargs"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            ];
          buildable = true;
          };
        };
      };
    }