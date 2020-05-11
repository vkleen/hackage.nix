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
    flags = { hspec-jenkins = false; dev = false; };
    package = {
      specVersion = "1.18";
      identifier = { name = "capability"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2018 EURL Tweag";
      maintainer = "andreas.herrmann@tweag.io";
      author = "";
      homepage = "https://github.com/tweag/capability";
      url = "";
      synopsis = "Extensional capabilities and deriving combinators";
      description = "Standard capability type classes for extensional effects and combinators\nto derive capability instances with little boilerplate.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."constraints" or (buildDepError "constraints"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."generic-lens" or (buildDepError "generic-lens"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-unlift" or (buildDepError "monad-unlift"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mutable-containers" or (buildDepError "mutable-containers"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."safe-exceptions" or (buildDepError "safe-exceptions"))
          (hsPkgs."streaming" or (buildDepError "streaming"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          ];
        buildable = true;
        };
      tests = {
        "examples" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."capability" or (buildDepError "capability"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."silently" or (buildDepError "silently"))
            (hsPkgs."streaming" or (buildDepError "streaming"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unliftio" or (buildDepError "unliftio"))
            ] ++ (pkgs.lib).optional (flags.hspec-jenkins) (hsPkgs."hspec-jenkins" or (buildDepError "hspec-jenkins"));
          buildable = true;
          };
        };
      };
    }