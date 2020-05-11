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
      identifier = { name = "minimung"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yakov Zaytsev <yakov@yakov.cc>";
      author = "Yakov Zaytsev";
      homepage = "";
      url = "";
      synopsis = "Shows how to run grabber on Mac OS X";
      description = "This version is known to work with GHC 6.12 and Mac OS X 10.6.2.\n\nHaddock generated documentation is available from my homepage\n\nminimung is capable to do real time CIF??\n\nModules under 'Mac' are stable and good.\n\n'Minimung.hs' is a clumsy example of usage.\n";
      buildType = "Simple";
      };
    components = {
      exes = {
        "minimung" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."GLUT" or (buildDepError "GLUT"))
            ];
          frameworks = [
            (pkgs."QuickTime" or (sysDepError "QuickTime"))
            (pkgs."Carbon" or (sysDepError "Carbon"))
            ];
          buildable = true;
          };
        };
      };
    }