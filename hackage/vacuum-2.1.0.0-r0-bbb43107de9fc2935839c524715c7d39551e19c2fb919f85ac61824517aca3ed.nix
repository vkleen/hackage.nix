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
      identifier = { name = "vacuum"; version = "2.1.0.0"; };
      license = "LGPL-3.0-only";
      copyright = "Copyright (c) Matt Morrow  2009,\n(c) Austin Seipp 2011-2012";
      maintainer = "Austin Seipp <mad.one@gmail.com>";
      author = "Matt Morrow";
      homepage = "http://thoughtpolice.github.com/vacuum";
      url = "";
      synopsis = "Graph representation of the GHC heap";
      description = "Vacuum is a library for extracting graph representations of values\nfrom the GHC heap at runtime. Those graphs may then be further\nprocessed or translated to various representations for visualization --\nlike Graphviz, or Ubigraph.\n\nBy itself this library is not of much use to most users, unless you\nwant to use the raw graph data to visualize the heap in some (new)\nway. Most people will want to translate the graph representation to\nsomething like GraphViz format, which can then be rendered to a\npretty PNG or SVG file for viewing. See the @vacuum-graphviz@\npackage for more.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }