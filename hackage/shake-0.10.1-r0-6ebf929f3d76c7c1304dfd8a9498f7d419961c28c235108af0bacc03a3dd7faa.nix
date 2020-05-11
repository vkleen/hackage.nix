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
    flags = { testprog = false; portable = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "shake"; version = "0.10.1"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2011-2013";
      maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "http://community.haskell.org/~ndm/shake/";
      url = "";
      synopsis = "Build system library, like Make, but more accurate dependencies.";
      description = "Shake is a Haskell library for writing build systems - designed as a\nreplacement for @make@. See \"Development.Shake\" for an introduction,\nincluding an example. Further examples are included in the Cabal tarball,\nunder the @Examples@ directory.\n\nTo use Shake the user writes a Haskell program\nthat imports \"Development.Shake\", defines some build rules, and calls\nthe 'Development.Shake.shake' function. Thanks to do notation and infix\noperators, a simple Shake build system\nis not too dissimilar from a simple Makefile. However, as build systems\nget more complex, Shake is able to take advantage of the excellent\nabstraction facilities offered by Haskell and easily support much larger\nprojects.\n\nThe Shake library provides all the standard features available in other\nbuild systems, including automatic parallelism and minimal rebuilds.\nShake provides highly accurate dependency tracking, including seamless\nsupport for generated files, and dependencies on system information\n(i.e. compiler version). Shake can produce profile reports, indicating\nwhich files and take longest to build, and providing an analysis of the\nparallelism.\n\nThe theory behind Shake is described in an ICFP 2012 paper,\nShake Before Building -- Replacing Make with Haskell\n<http://community.haskell.org/~ndm/downloads/paper-shake_before_building-10_sep_2012.pdf>.\nThe associated talk forms a short overview of Shake\n<http://www.youtube.com/watch?v=xYCPpXVlqFM>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          ] ++ (pkgs.lib).optionals (!flags.portable) ((pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix")));
        buildable = true;
        };
      exes = {
        "shake" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ] ++ (pkgs.lib).optionals (!flags.portable) ((pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix")));
          buildable = true;
          };
        "shake-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ] ++ (pkgs.lib).optionals (!flags.portable) ((pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix")));
          buildable = if flags.testprog then true else false;
          };
        };
      };
    }