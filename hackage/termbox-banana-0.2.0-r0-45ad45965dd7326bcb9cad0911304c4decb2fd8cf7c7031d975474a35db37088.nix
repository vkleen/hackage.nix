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
    flags = { build-examples = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "termbox-banana"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2018-2019, Mitchell Rosen";
      maintainer = "Mitchell Rosen <mitchellwrosen@gmail.com>";
      author = "Mitchell Rosen";
      homepage = "https://github.com/mitchellwrosen/termbox-banana";
      url = "";
      synopsis = "reactive-banana + termbox";
      description = "A @reactive-banana@-based interface to writing @termbox@ programs.\n\nSee also the <https://hackage.haskell.org/package/termbox termbox> package for a\nlower-level, imperative interface.\n\n__/NOTE/__: The dependencies listed on Hackage are misleading! Most are only\nused in the examples provided, which are built only if the @build-examples@\nflag is explicitly enabled.\n\nThe actual dependencies of the @termbox-banana@ library are only:\n\n* base\n* reactive-banana\n* termbox";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."reactive-banana" or (buildDepError "reactive-banana"))
          (hsPkgs."termbox" or (buildDepError "termbox"))
          ];
        buildable = true;
        };
      exes = {
        "termbox-banana-example-echo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."reactive-banana" or (buildDepError "reactive-banana"))
            (hsPkgs."termbox-banana" or (buildDepError "termbox-banana"))
            ];
          buildable = if !flags.build-examples then false else true;
          };
        "termbox-banana-example-hoogle" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."reactive-banana" or (buildDepError "reactive-banana"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
            (hsPkgs."termbox-banana" or (buildDepError "termbox-banana"))
            ];
          buildable = if !flags.build-examples then false else true;
          };
        };
      };
    }