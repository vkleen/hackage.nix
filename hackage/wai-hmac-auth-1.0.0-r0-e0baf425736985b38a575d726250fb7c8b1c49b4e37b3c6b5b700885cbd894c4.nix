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
      identifier = { name = "wai-hmac-auth"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2014, aidan coyne";
      maintainer = "coynea90@gmail.com";
      author = "aidan coyne";
      homepage = "https://github.com/raptros/wai-hmac-auth";
      url = "";
      synopsis = "hmac authentication tools for WAI apps";
      description = "authenticate requests made to your WAI apps using HMAC.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-hmac-auth" or (buildDepError "wai-hmac-auth"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."byteable" or (buildDepError "byteable"))
            ];
          buildable = true;
          };
        };
      };
    }