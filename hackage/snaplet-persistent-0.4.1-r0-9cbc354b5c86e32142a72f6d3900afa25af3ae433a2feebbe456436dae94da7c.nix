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
      specVersion = "1.6";
      identifier = { name = "snaplet-persistent"; version = "0.4.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ozataman@gmail.com, mightybyte@gmail.com";
      author = "Soostone Inc. Ozgun Ataman, Doug Beardsley";
      homepage = "https://github.com/soostone/snaplet-persistent";
      url = "";
      synopsis = "persistent snaplet for the Snap Framework";
      description = "Snaplet support for using the Postgresql database\nwith a Snap Framework application via the persistent\npackage.  It also includes an authentication backend.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."clientsession" or (buildDepError "clientsession"))
          (hsPkgs."configurator" or (buildDepError "configurator"))
          (hsPkgs."heist" or (buildDepError "heist"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."MonadCatchIO-transformers" or (buildDepError "MonadCatchIO-transformers"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
          (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
          (hsPkgs."readable" or (buildDepError "readable"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."snap" or (buildDepError "snap"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      };
    }