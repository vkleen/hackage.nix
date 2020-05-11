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
    flags = { gtk = false; vty = false; curses = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "LambdaHack"; version = "0.2.10.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Mikolaj Konarski <mikolaj.konarski@funktory.com>";
      author = "Andres Loeh, Mikolaj Konarski";
      homepage = "http://github.com/kosmikus/LambdaHack";
      url = "";
      synopsis = "A roguelike game engine in early and active development";
      description = "This is an alpha release of LambdaHack,\na game engine library for roguelike games\nof arbitrary theme, size and complexity,\npackaged together with a small example dungeon crawler.\nWhen completed, the engine will let you specify content\nto be procedurally generated, define the AI behaviour\non top of the generic content-independent rules\nand compile a ready-to-play game binary, using either\nthe supplied or a custom-made main loop.\nSeveral frontends are available (GTK is the default)\nand many other generic engine components are easily overridden,\nbut the fundamental source of flexibility lies\nin the strict and type-safe separation of code and content\nand of clients (human and AI-controlled) and server.\n\nThis is a minor release, primarily intended to fix\nbroken builds on hackage and travis. Changes since 0.2.10\nare mostly unrelated to gameplay: overhauled dungeon generation\ncode and the use of the external library assert-failure\nfor expressing assertions and error messages.\nUpcoming features: new and improved frontends, improved AI\n(pathfinding, autoexplore, better ranged combat), dynamic\nlight sources, explosions, player action undo/redo, completely\nredesigned UI. Long term goals are focused on procedural\ncontent generation and include in-game content creation,\nauto-balancing and persistent content modification\nbased on player behaviour.\n\nA larger game that depends on the LambdaHack library\nis Allure of the Stars, available from\n<http://hackage.haskell.org/package/Allure>.\n\nNote: All modules in this library are kept visible,\nto let games override and reuse them.\nOTOH, to reflect that some modules are implementation details\nrelative to others, the source code adheres to the following\nconvention. If a module has the same name as a directory,\nthe module is the exclusive interface to the directory.\nNo references to the modules in the directory are allowed\nexcept from the interface module. This policy is only binding\ninside the library --- users are free to do whatever they\nplease, since the library authors are in no position to guess\ntheir particular needs.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ConfigFile" or (buildDepError "ConfigFile"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."assert-failure" or (buildDepError "assert-failure"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."enummapset-th" or (buildDepError "enummapset-th"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."keys" or (buildDepError "keys"))
          (hsPkgs."miniutter" or (buildDepError "miniutter"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ] ++ (if flags.gtk
          then [ (hsPkgs."gtk" or (buildDepError "gtk")) ]
          else if flags.vty
            then [ (hsPkgs."vty" or (buildDepError "vty")) ]
            else if flags.curses
              then [ (hsPkgs."hscurses" or (buildDepError "hscurses")) ]
              else [ (hsPkgs."gtk" or (buildDepError "gtk")) ]);
        buildable = true;
        };
      exes = {
        "LambdaHack" = {
          depends = [
            (hsPkgs."LambdaHack" or (buildDepError "LambdaHack"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."ConfigFile" or (buildDepError "ConfigFile"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."assert-failure" or (buildDepError "assert-failure"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."enummapset-th" or (buildDepError "enummapset-th"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."keys" or (buildDepError "keys"))
            (hsPkgs."miniutter" or (buildDepError "miniutter"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ];
          buildable = true;
          };
        };
      };
    }