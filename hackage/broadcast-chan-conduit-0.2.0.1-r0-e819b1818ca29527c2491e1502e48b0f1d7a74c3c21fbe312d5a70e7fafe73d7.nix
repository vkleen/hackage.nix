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
      identifier = { name = "broadcast-chan-conduit"; version = "0.2.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright © 2014-2018 Merijn Verstraaten";
      maintainer = "Merijn Verstraaten <merijn@inconsistent.nl>";
      author = "Merijn Verstraaten";
      homepage = "https://github.com/merijn/broadcast-chan";
      url = "";
      synopsis = "Conduit-based parallel streaming code for broadcast-chan";
      description = "__WARNING:__ While the code in this library should be fairly stable and\nproduction, the API is something I'm still working on. API changes will\nfollow the PVP, but __expect__ breaking API changes in future versions!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."broadcast-chan" or (buildDepError "broadcast-chan"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.10") (hsPkgs."void" or (buildDepError "void"));
        buildable = true;
        };
      tests = {
        "conduit" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."broadcast-chan-conduit" or (buildDepError "broadcast-chan-conduit"))
            (hsPkgs."broadcast-chan-tests" or (buildDepError "broadcast-chan-tests"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            ];
          buildable = true;
          };
        };
      };
    }