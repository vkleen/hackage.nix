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
      identifier = { name = "csound-expression"; version = "4.6"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "<anton.kholomiov@gmail.com>";
      author = "Anton Kholomiov";
      homepage = "https://github.com/anton-k/csound-expression";
      url = "";
      synopsis = "library to make electronic music";
      description = "Welcome to the simplest textual synthesizer.\n\n> dac \$ osc 440\n\nCsound-expression is a Haskell framework for computer music.\nWith the help of the library we can create our instruments on the fly.\nA few lines in the interpreter is enough to get the cool sound going\nout of your speakers. It can be used for simple daily sound-file processing\nor for a full-blown live performances.\n\nGot interested? Check out the guide: <https://github.com/anton-k/csound-expression/blob/master/tutorial/Index.md>\n\nAcknowledgements (I'd like to mention those who supported me a lot with their music and ideas):\n\n* music: entertainment for the braindead, three pandas and the moon, odno no, ann's'annat & alizbar, toe, iamthemorning, atoms for piece / radiohead, loscil, boards of canada,\nHozan Yamamoto, Tony Scott and Shinichi Yuize.\n\n* ideas: Conal Elliott, Oleg Kiselyov, Paul Hudak, Gabriel Gonzalez, Rich Hickey and Csound's community.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."Boolean" or (buildDepError "Boolean"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."csound-expression-typed" or (buildDepError "csound-expression-typed"))
          (hsPkgs."csound-expression-dynamic" or (buildDepError "csound-expression-dynamic"))
          (hsPkgs."csound-expression-opcodes" or (buildDepError "csound-expression-opcodes"))
          ];
        buildable = true;
        };
      };
    }