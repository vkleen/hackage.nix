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
      identifier = { name = "hssourceinfo"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      author = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      homepage = "";
      url = "";
      synopsis = "get haskell source code info";
      description = "now only module dependencies and code line numbers\n\n> % hsmodtree xturtle/src\n> Graphics.X11.Turtle\n>   + Graphics.X11.TurtleMove\n>   |   + Graphics.X11.TurtleState\n>   |   + Graphics.X11.TurtleField\n>   + Graphics.X11.TurtleInput\n>   |   + Grahpics.X11.TurtleState\n>   + Graphics.X11.TurtleShape\n> % hscodeline xturtle/src\n> Graphics/X11/Turtle.hs          158\n> Graphics/X11/TurtleMove.hs      82\n> Graphics/X11/TurtleState.hs     54\n> Graphics/X11/TurtleField.hs     428\n> Graphics/X11/TurtleInput.hs     76\n> Graphics/X11/TurtleShape.hs     10\n> total                           808";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hsmodtree" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."regexpr" or (buildDepError "regexpr"))
            ];
          buildable = true;
          };
        "hscodelines" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."regexpr" or (buildDepError "regexpr"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ];
          buildable = true;
          };
        };
      };
    }