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
      identifier = { name = "ghcjs-dom-hello"; version = "1.2.0.0"; };
      license = "MIT";
      copyright = "(c) Hamish Mackenzie";
      maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@gmail.com>";
      author = "Hamish Mackenzie";
      homepage = "https://github.com/ghcjs/ghcjs-dom-hello";
      url = "";
      synopsis = "GHCJS DOM Hello World, an example package";
      description = "This is an implementation of the classic \"Hello World\" program using GHCJS DOM,\nas an example of how to create a minimal GHCJS DOM application.\nPlease submit any suggestions and improvements.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ghcjs-dom-hello" = {
          depends = [
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghcjs-dom" or (buildDepError "ghcjs-dom"))
            ];
          buildable = true;
          };
        };
      };
    }