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
      identifier = { name = "blank-canvas"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2014 The University of Kansas";
      maintainer = "andygill@ku.edu";
      author = "Andy Gill";
      homepage = "https://github.com/ku-fpg/blank-canvas/wiki";
      url = "";
      synopsis = "HTML5 Canvas Graphics Library";
      description = "blank-canvas is a Haskell binding to the complete\nHTML5 Canvas API. blank-canvas allows Haskell\nusers to write, in Haskell, interactive images\nonto their web browsers. blank-canvas gives the\nuser a single full-window canvas, and provides\nmany well-documented functions for rendering\nimages.\n\n@\n&#123;-# LANGUAGE OverloadedStrings #-&#125;\nmodule Main where\nimport Graphics.Blank                     -- import the blank canvas\n\nmain = blankCanvas 3000 \$ \\\\ context -> do -- start blank canvas on port 3000\n&#32;&#32;send context \$ do                       -- send commands to this specific context\n&#32;&#32;&#32;&#32;moveTo(50,50)\n&#32;&#32;&#32;&#32;lineTo(200,100)\n&#32;&#32;&#32;&#32;lineWidth 10\n&#32;&#32;&#32;&#32;strokeStyle \"red\"\n&#32;&#32;&#32;&#32;stroke()                              -- this draws the ink into the canvas\n@\n\n<<https://github.com/ku-fpg/blank-canvas/wiki/images/Red_Line.png>>\n\nFor more details, read the <https://github.com/ku-fpg/blank-canvas/wiki blank-canvas wiki>.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."kansas-comet" or (buildDepError "kansas-comet"))
          (hsPkgs."scotty" or (buildDepError "scotty"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      };
    }