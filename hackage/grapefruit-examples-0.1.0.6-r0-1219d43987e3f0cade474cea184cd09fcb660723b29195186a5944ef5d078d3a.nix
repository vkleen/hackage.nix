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
      identifier = { name = "grapefruit-examples"; version = "0.1.0.6"; };
      license = "BSD-3-Clause";
      copyright = "© 2007–2009 Brandenburgische Technische Universität Cottbus\n© 2011–2014 Wolfgang Jeltsch";
      maintainer = "wolfgang-it@jeltsch.info";
      author = "Wolfgang Jeltsch";
      homepage = "https://grapefruit-project.org/";
      url = "https://hackage.haskell.org/package/grapefruit-examples-0.1.0.6/grapefruit-examples-0.1.0.6.tar.gz";
      synopsis = "Examples using the Grapefruit library";
      description = "Grapefruit is a library for Functional Reactive Programming (FRP)\nwith a focus on user interfaces. FRP makes it possible to\nimplement reactive and interactive systems in a declarative\nstyle. To learn more about FRP, have a look at\n<http://haskell.org/haskellwiki/Functional_Reactive_Programming>.\n\nThis package contains a collection of examples using Grapefruit.\n\nFor running an example, you can start GHCi and enter the\nfollowing:\n\n@\nimport Graphics.UI.Grapefruit.Circuit\nimport Graphics.UI.Grapefruit./UIBackend/\nimport Examples.Grapefruit./Example/\nrun /UIBackend/ mainCircuit ()\n@\n\nReplace @/Example/@ with the name of the example to run and\n@/UIBackend/@ with the name of the UI backend you want to use. At\nthe moment, the only examples are @Simple@, @Switching@,\n@Converter@, @ListView@, and @SetView@, and the only UI backend\nis @GTK@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."fraction" or (buildDepError "fraction"))
          (hsPkgs."grapefruit-frp" or (buildDepError "grapefruit-frp"))
          (hsPkgs."grapefruit-records" or (buildDepError "grapefruit-records"))
          (hsPkgs."grapefruit-ui" or (buildDepError "grapefruit-ui"))
          ];
        buildable = true;
        };
      };
    }