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
      specVersion = "1.8";
      identifier = { name = "pi-calculus"; version = "0.0.4"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "will.derenzymartin@gmail.com";
      author = "Will de Renzy-Martin";
      homepage = "https://github.com/renzyq19/pi-calculus";
      url = "";
      synopsis = "Applied pi-calculus compiler";
      description = "Phi - A compiler for the applied pi-calculus. Very rough around the edges.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "phi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."io-streams" or (buildDepError "io-streams"))
            ];
          buildable = true;
          };
        };
      };
    }