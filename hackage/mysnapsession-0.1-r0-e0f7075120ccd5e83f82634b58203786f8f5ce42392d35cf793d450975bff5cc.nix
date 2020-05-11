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
      identifier = { name = "mysnapsession"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Chris Smith <cdsmith@gmail.com>";
      author = "Chris Smith <cdsmith@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Memory-backed sessions and continuations for Snap web apps";
      description = "This package provides two Snap extensions.  The first is\nan in-memory session manager, which stores sessions for\neach client.  The session object type is user-defined.\nBecause sessions are memory-backed, sticky session routing\nis needed to use this extension with load balancing.\n\nThe second extension provides a continuation-based\nprogramming model called dialogues, which allow natural\nspecification of stateful interactions with the client\nthat span multiple requests.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."heist" or (buildDepError "heist"))
          (hsPkgs."hexpat" or (buildDepError "hexpat"))
          (hsPkgs."MonadCatchIO-transformers" or (buildDepError "MonadCatchIO-transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."snap" or (buildDepError "snap"))
          (hsPkgs."snap-core" or (buildDepError "snap-core"))
          (hsPkgs."snap-server" or (buildDepError "snap-server"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          ];
        buildable = true;
        };
      };
    }