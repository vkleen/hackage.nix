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
      identifier = { name = "mueval"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Gwern <gwern0@gmail.com>";
      author = "Gwern";
      homepage = "http://code.haskell.org/mubot/";
      url = "";
      synopsis = "Safely evaluate Haskell expressions";
      description = "Mueval is a Haskell interpreter. It\nuses the GHC API to evaluate arbitrary Haskell expressions.\nImportantly, mueval takes many precautions to defang and avoid \"evil\"\ncode.  It uses resource limits, whitelisted modules,\nspecial Show instances for IO, threads, changes of directory, and so\non to sandbox the Haskell code. (It is much like Lambdabot's famous\nevaluation functionality.)\n\nCurrently there is a major hole in Mueval: it is possible use a function\nwithout importing it, which allows the module whitelisting to be bypassed,\nand hence, unsafePerformIO and its various type-breaking friends can be used\nto do arbitrary things. Mueval uses a blacklist to avoid the most naive and obvious\ndangerous function imports, but this is a very weak mechanism and cannot be relied\nupon.\n\nUntil this hole is fixed, Mueval should *not* be used on potentially hostile input.\n\nMueval is currently POSIX-only.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."hint" or (buildDepError "hint"))
          (hsPkgs."show" or (buildDepError "show"))
          ];
        buildable = true;
        };
      exes = {
        "mueval" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }