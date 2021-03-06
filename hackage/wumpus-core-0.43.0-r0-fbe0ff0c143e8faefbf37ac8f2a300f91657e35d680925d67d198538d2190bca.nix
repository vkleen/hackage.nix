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
      identifier = { name = "wumpus-core"; version = "0.43.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Pure Haskell PostScript and SVG generation. ";
      description = "\nWumpus-Core is a low-level library for generating static 2D\nvector pictures, its salient feature is portability due to no\nFFI dependencies. It can generate PostScript (EPS) files and SVG\nfiles. The generated PostScript code is plain and reasonably\nefficient as the use of stack operations, i.e @gsave@ and\n@grestore@, is minimized.\n\nAlthough Wumpus-Core only generates vector output, the generated\nPostScript can be interpreted by GraphicsMagick or a similar\ntool to convert EPS files into bitmap image files (e.g JPEGs).\n\nWumpus-Core makes pictures from /paths/ and text /labels/. Paths\nthemselves are made from points. The usual affine\ntransformations (rotations, scaling, translations) can be\napplied to Pictures. Unlike PostScript there is no notion of a\ncurrent point, Wumpus-Core builds pictures in a coordinate-free\nstyle.\n\nGENERAL DRAWBACKS...\n\nFor actually building pictures, diagrams, etc. Wumpus-Core is\nvery low-level. There are two supplementary packages\n@Wumpus-Basic@ and @Wumpus-Drawing@ also on Hackage that aim to\nbe a higher-level basis for creating certain types of diagram,\nbut they are experimental - functionality is added and dropped\nbetween releases and curently the API is too unstable to write\ncode upon (they should be considered a technology preview rather\nthan re-usable libraries).\n\nAlso, some of the design decisions made for Wumpus-Core are not\nsophisticated - e.g. how path and text attributes like colour are\nhandled, and how the bounding boxes of text labels are\ncalculated. Compared to other systems, Wumpus might be rather\nlimited, however, the design permits a fairly simple\nimplementation.\n\n\nChangelog:\n\nv0.42.1 to v0.43.0:\n\n* API change - the function @bezierCircle@ in @Core.Geometry@\nhas changed. It now implements a better method of drawing\ncircles with Bezier curves and no longer needs the\nsubvision factor. The old circle drawing function has been\nretained as @subdivisionCircle@ as it is useful for\ncorroborating @bezierCircle@, but the general use of\n@subdivisionCircle@ should be avoided.\n\n* Added a function @bezierEllipse@ to @Core.Geometry@.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          ];
        buildable = true;
        };
      };
    }