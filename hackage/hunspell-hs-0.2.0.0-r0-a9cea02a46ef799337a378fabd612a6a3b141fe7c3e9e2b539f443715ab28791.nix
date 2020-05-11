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
      identifier = { name = "hunspell-hs"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2018 Ashutosh Rishi Ranjan";
      maintainer = "ashutoshrishi92@gmail.com";
      author = "Ashutosh Rishi Ranjan";
      homepage = "https://github.com/ashutoshrishi/hunspell-hs#readme";
      url = "";
      synopsis = "Hunspell thread-safe FFI bindings for spell checking.";
      description = "Please see the README on GitHub at <https://github.com/ashutoshrishi/hunspell-hs#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."stm" or (buildDepError "stm"))
          ];
        libs = (pkgs.lib).optional (system.isOsx) (pkgs."hunspell-1.6" or (sysDepError "hunspell-1.6"));
        pkgconfig = (pkgs.lib).optional (system.isLinux) (pkgconfPkgs."hunspell" or (pkgConfDepError "hunspell"));
        buildable = true;
        };
      tests = {
        "hunspell-hs-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hunspell-hs" or (buildDepError "hunspell-hs"))
            (hsPkgs."stm" or (buildDepError "stm"))
            ];
          libs = (pkgs.lib).optional (system.isOsx) (pkgs."hunspell-1.6" or (sysDepError "hunspell-1.6"));
          pkgconfig = (pkgs.lib).optional (system.isLinux) (pkgconfPkgs."hunspell" or (pkgConfDepError "hunspell"));
          buildable = true;
          };
        };
      benchmarks = {
        "hunspell-hs-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."hunspell-hs" or (buildDepError "hunspell-hs"))
            (hsPkgs."stm" or (buildDepError "stm"))
            ];
          libs = (pkgs.lib).optional (system.isOsx) (pkgs."hunspell-1.6" or (sysDepError "hunspell-1.6"));
          pkgconfig = (pkgs.lib).optional (system.isLinux) (pkgconfPkgs."hunspell" or (pkgConfDepError "hunspell"));
          buildable = true;
          };
        };
      };
    }