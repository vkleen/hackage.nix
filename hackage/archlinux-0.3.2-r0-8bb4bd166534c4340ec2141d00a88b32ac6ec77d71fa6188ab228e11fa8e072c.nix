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
      specVersion = "1.8";
      identifier = { name = "archlinux"; version = "0.3.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Don Stewart <dons@galois.com>";
      author = "Don Stewart <dons@galois.com>";
      homepage = "http://code.haskell.org/~dons/code/archlinux";
      url = "";
      synopsis = "Support for working with Arch Linux packages";
      description = "Support for working with Arch Linux packages\n\nTo get info about a package:\n\n> info \"xmonad\"\n\nTo find packages matching a string:\n\n> search \"xmonad\"\n\nTo find packages owned by a maintainer:\n\n> maintainer \"arch-haskell\"\n\nGenerate an html page of interesting facts about\npackages in AUR and Hackage.\n\n> report [\"xmonad\"]\n\nSee also the cabal2arch tool <http://hackage.haskell.org/package/cabal2arch>\nfor conversion between Hackage and AUR.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."json" or (buildDepError "json"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."xhtml" or (buildDepError "xhtml"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."csv" or (buildDepError "csv"))
          ];
        buildable = true;
        };
      exes = {
        "arch-report" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        "distro-map" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        "get-arch-url" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        "latest-cabal" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        "mypackages" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        "update-aur-log" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        "needs-updates" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."strict-concurrency" or (buildDepError "strict-concurrency"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."csv" or (buildDepError "csv"))
            ];
          buildable = true;
          };
        };
      };
    }