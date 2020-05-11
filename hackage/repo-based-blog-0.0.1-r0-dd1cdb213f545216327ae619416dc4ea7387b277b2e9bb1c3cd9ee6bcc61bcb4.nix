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
      identifier = { name = "repo-based-blog"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2014 Sebastian Witte";
      maintainer = "woozletoff@gmail.com";
      author = "Sebastian Witte";
      homepage = "https://github.com/saep/repo-based-blog";
      url = "";
      synopsis = "Blogging module using blaze html for markup";
      description = "This package contains a module that can be used in web applications. It's use\ncases are only limited by the use of blaze for the markup of pages. If anynoe\ncares to abstract that away, I would not stand in the way.\n\nThis package also contains an executable that uses the dyre library to allow\na configuration of a web application in the way xmonad or yi does. An examle\ncan be fount in the 'RBB' module.\n\nThe blog contents are managed via a version control system. The filestore\nlibrary has been used as a backend for this and hence the supported\nrepository types mainly depend on the filestore version used. Thes currently\nsuppored repository types are git, mercurial and darcs. The entries are\nrendered using the pandoc library.\n\nFor more information see the haddock documentation of the exported modules or\nthe README.md included in this package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."filestore" or (buildDepError "filestore"))
          (hsPkgs."ixset" or (buildDepError "ixset"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          ];
        buildable = true;
        };
      exes = {
        "rbb" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repo-based-blog" or (buildDepError "repo-based-blog"))
            ];
          buildable = true;
          };
        };
      tests = {
        "hspec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repo-based-blog" or (buildDepError "repo-based-blog"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-discover" or (buildDepError "hspec-discover"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filestore" or (buildDepError "filestore"))
            (hsPkgs."ixset" or (buildDepError "ixset"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
            ];
          buildable = true;
          };
        };
      };
    }