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
      identifier = { name = "roguestar-gl"; version = "0.6.0.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "Christopher Lane Hinson <lane@downstairspeople.org>";
      author = "Christopher Lane Hinson <lane@downstairspeople.org>";
      homepage = "http://roguestar.downstairspeople.org/";
      url = "";
      synopsis = "Sci-fi roguelike game.  Client library.";
      description = "Roguestar-glut and roguestar-gtk depend on this library for the bulk of their functionality.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."GLUT" or (buildDepError "GLUT"))
          (hsPkgs."rsagl" or (buildDepError "rsagl"))
          (hsPkgs."rsagl-math" or (buildDepError "rsagl-math"))
          (hsPkgs."rsagl-frp" or (buildDepError "rsagl-frp"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."arrows" or (buildDepError "arrows"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."priority-sync" or (buildDepError "priority-sync"))
          ];
        buildable = true;
        };
      };
    }