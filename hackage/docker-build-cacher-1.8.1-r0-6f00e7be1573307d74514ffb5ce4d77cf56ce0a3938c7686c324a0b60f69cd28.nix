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
      identifier = { name = "docker-build-cacher"; version = "1.8.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Seatgeek";
      maintainer = "lorenzo@seatgeek.com";
      author = "Jose Lorenzo Rodriguez";
      homepage = "";
      url = "";
      synopsis = "Builds a services with docker and caches all of its intermediate stages";
      description = "A CLI tool to speed up multi-stage docker file builds by caching intermediate\nstages separately, so the can be used in successive builds.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "docker-build-cacher" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."turtle" or (buildDepError "turtle"))
            (hsPkgs."language-dockerfile" or (buildDepError "language-dockerfile"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."foldl" or (buildDepError "foldl"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            ];
          buildable = true;
          };
        };
      };
    }