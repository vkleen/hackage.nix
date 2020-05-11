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
      specVersion = "0";
      identifier = { name = "roguestar-engine"; version = "0.6.0.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "Christopher Lane Hinson <lane@downstairspeople.org>";
      author = "Christopher Lane Hinson";
      homepage = "http://roguestar.downstairspeople.org/";
      url = "";
      synopsis = "Sci-fi roguelike game.  Backend.";
      description = "Requires roguestar and roguestar-glut.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "roguestar-engine" = {
          depends = [
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."priority-sync" or (buildDepError "priority-sync"))
            (hsPkgs."PSQueue" or (buildDepError "PSQueue"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."data-memocombinators" or (buildDepError "data-memocombinators"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."MaybeT" or (buildDepError "MaybeT"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        };
      };
    }