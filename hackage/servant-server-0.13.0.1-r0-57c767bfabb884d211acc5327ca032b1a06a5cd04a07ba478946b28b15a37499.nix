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
      identifier = { name = "servant-server"; version = "0.13.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2014-2016 Zalora South East Asia Pte Ltd, Servant Contributors";
      maintainer = "haskell-servant-maintainers@googlegroups.com";
      author = "Servant Contributors";
      homepage = "http://haskell-servant.readthedocs.org/";
      url = "";
      synopsis = "A family of combinators for defining webservices APIs and serving them";
      description = "A family of combinators for defining webservices APIs and serving them\n\nYou can learn about the basics in the <http://haskell-servant.readthedocs.org/en/stable/tutorial/index.html tutorial>.\n\n<https://github.com/haskell-servant/servant/blob/master/servant-server/example/greet.hs Here>\nis a runnable example, with comments, that defines a dummy API and implements\na webserver that serves this API, using this package.\n\n<https://github.com/haskell-servant/servant/blob/master/servant-server/CHANGELOG.md CHANGELOG>";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (buildToolDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (buildToolDepError "Cabal")))
        (hsPkgs.buildPackages.cabal-doctest or (pkgs.buildPackages.cabal-doctest or (buildToolDepError "cabal-doctest")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
          (hsPkgs."http-media" or (buildDepError "http-media"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."string-conversions" or (buildDepError "string-conversions"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."word8" or (buildDepError "word8"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
        buildable = true;
        };
      exes = {
        "greet" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."string-conversions" or (buildDepError "string-conversions"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-wai" or (buildDepError "hspec-wai"))
            (hsPkgs."should-not-typecheck" or (buildDepError "should-not-typecheck"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover or (buildToolDepError "hspec-discover")))
            ];
          buildable = true;
          };
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }