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
      identifier = { name = "Shpadoinkle-router"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "fresheyeball@protonmail.com";
      author = "Isaac Shapira";
      homepage = "";
      url = "";
      synopsis = "A single page application rounter for Shpadoinkle based on Servant.";
      description = "Surjective single page application routing with Servant. Surjectivity means routes can be backward compatible, allowing URLs to evolve. Since routes are specified as Servant combinators, serving these routes from the backend is trivial. For an example of leveraging the client-server isomorphism via Servant specification, check the servant-crud example.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Shpadoinkle" or (buildDepError "Shpadoinkle"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."compactable" or (buildDepError "compactable"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."ghcjs-dom" or (buildDepError "ghcjs-dom"))
          (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
          (hsPkgs."jsaddle" or (buildDepError "jsaddle"))
          (hsPkgs."jsaddle-dom" or (buildDepError "jsaddle-dom"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          ] ++ (if compiler.isGhcjs && true
          then [
            (hsPkgs."servant-client-ghcjs" or (buildDepError "servant-client-ghcjs"))
            ]
          else [
            (hsPkgs."Shpadoinkle-backend-static" or (buildDepError "Shpadoinkle-backend-static"))
            (hsPkgs."servant-client" or (buildDepError "servant-client"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ]);
        buildable = true;
        };
      };
    }