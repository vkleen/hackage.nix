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
      identifier = { name = "wumpus-core"; version = "0.23.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Pure Haskell PostScript and SVG generation. ";
      description = "\nWumpus - (W)riter (M)onad (P)ost (S)cript.\n\nWumpus is a kernel library for generating 2D vector pictures,\nits salient feature is portability due to no FFI dependencies.\nIt can generate PostScript (EPS) files and SVG files. The\ngenerated PostScript code is plain [1] and reasonably\nefficient as the use of stack operations, i.e @gsave@ and\n@grestore@, is minimized.\n\nPictures in Wumpus are made from /paths/ and text /labels/.\nPaths themselves are made from points. The usual affine\ntransformations (rotations, scaling, translations) can be\napplied to geometric objects. Unlike PostScript there is no\nnotion of a current point, Wumpus builds pictures in a\ncoordinate-free style.\n\nGENERAL DRAWBACKS...\n\nFor actually drawing pictures, diagrams, etc. Wumpus is very\nlow level. There is a supplemantary package @wumpus-basic@\navailable that helps create certain types of diagram, but even\nthis lacks the higher-level stuff (polygons, arrows etc.) that\nwould make creating general drawings easy.\n\nSome of the design decisions made for wumpus-core are not\nsophisticated (e.g. how attributes like colour are handled,\nand how the bounding boxes of text labels are calculated), so\nWumpus might be limited compared to other systems. However,\nthe design permits a fairly simple implementation - which is\na priority. Text encoding an exception - I\\'m not sure how\nreasonable the design is. The current implementation\nappears okay for Latin 1 but may be inadequate for other\ncharacter sets, so I may have to revise it significantly.\n\nWARNING...\n\nThe module @Core.BoundingBox@ is likely to be reworked\nsignificantly in the future. It has too many functions that do\nnot offer distinct functionality. Some functions were removed in\nrevision 0.17.0 and some more are likely to follow.\n\n\n\\[1\\] Because the output is simple, straight-line PostScript\ncode, it is possible to use GraphicsMagick or a similar tool\nto convert Wumpus'\\s EPS files to many other formats\n(bitmaps).\n\nChangelog:\n\n0.22.0 TO 0.23.0:\n\n* @Basic.GraphicsState@ - extracted the font face fields from\n@FontAttr@ datatype into a separate datatype @FontFace@.\n\n* Added @PtSize@ a numeric type wrapping Double. This is\nspecifically for text size calculations, vis the\n@Core.FontSize@ module.\n\n* Changed all functions in @Core.FontSize@ to return @PtSize@\ninstead of a polymorphic type @u@ (where @u@ is an instance\nof Fractional). To get to another unit type rather than\nFontSize use an explicit conversion that scales the value\naccordingly.\n\n* Added FromPtSize class constraints to various functions in\n@Core.Picture@.\n\n* Added @charWidth@ to @Core.FontSize@.\n\n* Added @vlength@ to @Core.Geometry@\n\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."wl-pprint" or (buildDepError "wl-pprint"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."monadLib" or (buildDepError "monadLib"))
          (hsPkgs."xml" or (buildDepError "xml"))
          (hsPkgs."algebra" or (buildDepError "algebra"))
          ];
        buildable = true;
        };
      };
    }