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
      specVersion = "1.12";
      identifier = { name = "yam"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2018 Daniel YU";
      maintainer = "Daniel YU <leptonyu@gmail.com>";
      author = "Daniel YU";
      homepage = "https://github.com/leptonyu/yam#readme";
      url = "";
      synopsis = "Yam Web";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."salak" or (buildDepError "salak"))
          (hsPkgs."servant-server" or (buildDepError "servant-server"))
          (hsPkgs."servant-swagger" or (buildDepError "servant-swagger"))
          (hsPkgs."servant-swagger-ui" or (buildDepError "servant-swagger-ui"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          (hsPkgs."vault" or (buildDepError "vault"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          ];
        buildable = true;
        };
      exes = {
        "yam" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."persistent-sqlite" or (buildDepError "persistent-sqlite"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."reflection" or (buildDepError "reflection"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."salak" or (buildDepError "salak"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."servant-swagger" or (buildDepError "servant-swagger"))
            (hsPkgs."servant-swagger-ui" or (buildDepError "servant-swagger-ui"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
            (hsPkgs."vault" or (buildDepError "vault"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."yam" or (buildDepError "yam"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."reflection" or (buildDepError "reflection"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."salak" or (buildDepError "salak"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."servant-swagger" or (buildDepError "servant-swagger"))
            (hsPkgs."servant-swagger-ui" or (buildDepError "servant-swagger-ui"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
            (hsPkgs."vault" or (buildDepError "vault"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ];
          buildable = true;
          };
        };
      };
    }