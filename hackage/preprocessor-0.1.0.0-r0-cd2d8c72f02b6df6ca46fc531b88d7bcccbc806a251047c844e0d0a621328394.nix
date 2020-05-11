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
      identifier = { name = "preprocessor"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2016 Carlo Nucera";
      maintainer = "meditans@gmail.com";
      author = "Carlo Nucera";
      homepage = "http://github.com/meditans/preprocessor#readme";
      url = "";
      synopsis = "Remove cpp annotations to get the source ready for static analysis.";
      description = "Remove cpp annotations using the configuration with which you build the package, to get the source ready for static analysis with a parsing library like haskell-src-exts.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."filemanip" or (buildDepError "filemanip"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."microlens" or (buildDepError "microlens"))
          (hsPkgs."process" or (buildDepError "process"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "8.0") (hsPkgs."template-haskell" or (buildDepError "template-haskell"));
        buildable = true;
        };
      tests = {
        "preprocessor-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."preprocessor" or (buildDepError "preprocessor"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            ];
          buildable = true;
          };
        };
      };
    }