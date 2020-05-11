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
      identifier = { name = "graphtype"; version = "0.1.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2009 Dmitry Astapov";
      maintainer = "Max Desyatov <explicitcall at gmail.com>";
      author = "Dmitry Astapov";
      homepage = "http://github.com/explicitcall/graphtype";
      url = "";
      synopsis = "A simple tool to illustrate dependencies between Haskell types";
      description = "This tools produces diagrams of Haskell type interdependencies in the given source.\nActual drawing is done by graphviz tools (dot).";
      buildType = "Simple";
      };
    components = {
      exes = {
        "graphtype" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."dotgen" or (buildDepError "dotgen"))
            ];
          buildable = true;
          };
        };
      };
    }