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
      identifier = { name = "ghci-ng"; version = "10.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2005 The University of Glasgow, 2008 Claus Reinke, 2012 Kazu Yamamoto, 2014 Chris Done";
      maintainer = "chrisdone@gmail.com";
      author = "The GHC Team, Chris Done";
      homepage = "https://github.com/chrisdone/ghci-ng";
      url = "";
      synopsis = "Next generation GHCi";
      description = "GHCi plus extra goodies. See <https://github.com/chrisdone/ghci-ng#features README> for feature list.\n\nNOTE: The feature-set of @ghci-ng-10.0.0@ has been merged back upstream and is therefore available in GHCi 8.0 proper!";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ghci-ng" = {
          depends = ((pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.8") (hsPkgs."ghc" or (buildDepError "ghc")) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "7.8") [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."time" or (buildDepError "time"))
            ]) ++ (if system.isWindows
            then [ (hsPkgs."Win32" or (buildDepError "Win32")) ]
            else [ (hsPkgs."unix" or (buildDepError "unix")) ]);
          buildable = true;
          };
        };
      };
    }