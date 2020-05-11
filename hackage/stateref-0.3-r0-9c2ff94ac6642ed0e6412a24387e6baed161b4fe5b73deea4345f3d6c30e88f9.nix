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
    flags = { usestm = true; usetmvar = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "stateref"; version = "0.3"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "James Cook <mokus@deepbondi.net>";
      author = "James Cook <mokus@deepbondi.net>";
      homepage = "http://code.haskell.org/~mokus/stateref/";
      url = "";
      synopsis = "Abstraction for things that work like IORef.";
      description = "A collection of type-classes generalizing the\nread\\/write\\/modify operations for stateful variables\nprovided by things like IORef, TVar, &c.\nNote that The interface has changed a bit from the\n0.2.* version.  \\\"*Ref\\\" functions are now called\n\\\"*Reference\\\" and new \\\"*Ref\\\" function exist with\nsimpler signatures.\nThe new 'Ref' existential type provides a convenient\nmonad-indexed reference type, and the HasRef class\nindicates monads for which there is a default\nreference type for every referent.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ] ++ (pkgs.lib).optional (flags.usestm) (hsPkgs."stm" or (buildDepError "stm"));
        buildable = if flags.usestm
          then if flags.usetmvar
            then if compiler.isHugs && true then false else true
            else true
          else true;
        };
      };
    }