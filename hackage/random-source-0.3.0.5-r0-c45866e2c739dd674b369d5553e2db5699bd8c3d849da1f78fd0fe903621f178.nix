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
    flags = { base4 = true; mtl2 = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "random-source"; version = "0.3.0.5"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "James Cook <mokus@deepbondi.net>";
      author = "James Cook <mokus@deepbondi.net>";
      homepage = "https://github.com/mokus0/random-fu";
      url = "";
      synopsis = "Generic basis for random number generators";
      description = "Random number generation based on entropy sources\nable to produce a small but well-defined set of\nprimitive variates.  Also includes facilities for\n\\\"completing\\\" partial implementations, making it\neasy to define new entropy sources in a way that\nis naturally forward-compatible.\n\nChanges in 0.3.0.5: Renamed some internal modules.  No other changes.\n\nChanges in 0.3.0.4: Fixed a typo that broke building\nwith MTL-1\n\nChanges in 0.3.0.3: Fixes for GHC's deprecation\nof Foreign.unsafePerformIO\n\nChanges in 0.3.0.2: Fixes for GHC 7.2.*'s crazy\nTemplate Haskell changes.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."flexible-defaults" or (buildDepError "flexible-defaults"))
          (hsPkgs."mersenne-random-pure64" or (buildDepError "mersenne-random-pure64"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."stateref" or (buildDepError "stateref"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."th-extras" or (buildDepError "th-extras"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.10") (hsPkgs."mwc-random" or (buildDepError "mwc-random"))) ++ [
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ]) ++ (if flags.base4
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ]
          else [ (hsPkgs."base" or (buildDepError "base")) ]);
        buildable = true;
        };
      };
    }