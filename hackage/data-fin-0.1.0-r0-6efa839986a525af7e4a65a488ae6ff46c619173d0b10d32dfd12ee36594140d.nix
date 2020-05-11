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
    flags = { base4 = true; splitbase = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "data-fin"; version = "0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2012--2013 wren ng thornton";
      maintainer = "wren@community.haskell.org";
      author = "wren ng thornton";
      homepage = "http://code.haskell.org/~wren/";
      url = "";
      synopsis = "Finite totally ordered sets";
      description = "Finite totally ordered sets";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."prelude-safeenum" or (buildDepError "prelude-safeenum"))
          (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
          (hsPkgs."lazysmallcheck" or (buildDepError "lazysmallcheck"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }