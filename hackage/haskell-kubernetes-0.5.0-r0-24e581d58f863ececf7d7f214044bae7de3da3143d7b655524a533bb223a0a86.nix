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
      identifier = { name = "haskell-kubernetes"; version = "0.5.0"; };
      license = "MIT";
      copyright = "2016 - SoundCloud Ltd.";
      maintainer = "Aaron Levin <aaron.levin@soundcloud.com>";
      author = "Aaron Levin";
      homepage = "https://github.com/soundcloud/haskell-kubernetes";
      url = "";
      synopsis = "Haskell bindings to the Kubernetes API (via swagger-codegen)";
      description = "This project contains haskell bindings to the v1 Kubernetes api generated via <https://github.com/swagger-api/swagger-codegen swagger-codegen>. The client and (mock) server generated use the <https://github.com/haskell-servant/servant servant> project, thanks to the work of <(https://github.com/algas Masahiro Yamauchi>!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-client" or (buildDepError "servant-client"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."wai" or (buildDepError "wai"))
          ];
        buildable = true;
        };
      };
    }