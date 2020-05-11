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
      specVersion = "1.2";
      identifier = { name = "wumpus-basic"; version = "0.9.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Common drawing utilities built on wumpus-core.";
      description = "\n\\*\\* WARNING \\*\\* - this package is sub-alpha. It was released\nto Hackage prematurely - designing a higher-level drawing\nlibrary turns out to be much more demanding than designing a\nlow-level one (Wumpus-Core).\n\nA few of the modules (SafeFonts, SVGColours, X11Colours) are\nfairly stable others simply aren\\'t and may even disappear in\nsubsequent updates.\n\n\nChangelog:\n\n0.8.0 to 0.9.0:\n\n* Re-worked @Basic.Text.LRSymbol@ changed the type name and the\ntypes of the run functions. Added more symbols and a new demo\n@Symbols.hs@.\n\n* @ScalingContext@ added to @Basic.Graphic@. Changed\n@monoTextWidth@ to take a character count, the old behaviour\nis recreated by the new function @monoTextLength@.\n\n* @Basic.Graphic.Chain@ removed. It is now superseded by\n@Basic.Chains@.\n\n* Added new property to @DrawingContext@ for line spacing\nscaling factor, and added a new drawing primitive\n@textlineMulti@ for multi-line, left justified labels.\n\n* Synthezied attribute /getters/ such as @textDimensions@ moved\nfrom @Basic.Graphic.DrawingContext@ to the new module\n@Basic.Graphic.Query@. The type of all the functions has\nchanged to DrawingF. @lowerxHeight@ is renamed\n@monoLowerxHeight@ emphasizing that the metrics pertain to\nmonospaced Courier font.\n\n* Added Shapes modules.\n\n* TurtleMonad module - the TurtleDrawing type and run functions\nhave been removed and the internals have been reworked.\nTurtle is now run solely as a /local effect/ within the\nDrawing monad.\n\n0.7.0 to 0.8.0:\n\n* Re-introduced LRText and LRSymbol - they now work with\nWumpus-Core\\'s kerning support.\n\n* Changes to @Graphic.Basic.BaseTypes@ - @DrawingObject@\nrenamed to @DrawingF@. @HPrim@ wrapped as a newtype to\nsupport a Monoid instance. Removed @appendGraphic@ and @gcat@\nas they can be achieved with @mappend@ and @mconcat@.\n@appendAt@ renamed to @lgappend@. @PointT@ remaned to\n@PointF@.\n\n* Changes to @Graphic.Basic.Drawing@ - @drawAt@, @drawAtImg@,\n@drawConn@, @drawConnImg@ all removed. They are replaced\nby @draw@ and @drawi@ together with then new @at@ and @conn@\ncombinators.\n\n* Changes to @Basic.Graphic.PrimGraphic@ - @localDrawingContext@\nrenamed to @localLG@ and moved to @Basic.Graphic.BaseTypes@.\n\n* Updates to @Basic.SafeFonts@ to work with changes to\n@Wumpus.Core@.\n\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."wumpus-core" or (buildDepError "wumpus-core"))
          ];
        buildable = true;
        };
      };
    }