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
      identifier = { name = "processing"; version = "1.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Daniel Díaz (dhelta.diaz `at` gmail.com)";
      author = "Daniel Díaz";
      homepage = "";
      url = "";
      synopsis = "Web graphic applications with Processing.";
      description = "/Processing/ is a visual design programming language.\n/Processing.js/ is the sister project of Processing designed\nfor the web.\nThe Haskell /processing/ package is a web animation library\nwith /Processing.js/ as backend.\n\n/What is this for?/\n\nWith this library you are able to write scripts that, once\nexecuted in a browser, will execute interactive visual programs.\n\n/Where can I see a running example?/\n\nAn example output can be reached at <http://liibe.com/experimental/rocket.html>.\nAlso, take a look at <http://liibe.com/experimental/mill.html>.\nThe code of the latter is included in the source distribution (\\/examples\\/mill.hs).\n\n/How do I learn to use it?/\n\nThe API reference of the library includes guidance and is complemented with\ncode examples. Look also to the /examples/ directory included in the source\ndistribution. It contains some fully working examples.\n\nThe library provides different APIs (interfaces). Each one with a different\nphilosophy.\n\n* /Simple/ (\"Graphics.Web.Processing.Simple\"): An abstract interface, focusing\nin what you want to be displayed, but not how. The library will know how to\nwrite the processing code you need. However, you may lack some features that\nyou can find in other interfaces.\n\n* /Mid/ (\"Graphics.Web.Processing.Mid\"): More imperative feeling, with variables\nand commands. But also convenient and complete. This is the default interface,\nre-exported by \"Graphics.Web.Processing\".\n\n* /Basic/ (\"Graphics.Web.Processing.Basic\"): For people that like to do things\nby hand. The output processing code is predictable and you have great\ncontrol over it.\n\nThe module \"Graphics.Web.Processing.Html\" helps you to create the HTML document\nwhere you will display the animation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mainland-pretty" or (buildDepError "mainland-pretty"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."multiset" or (buildDepError "multiset"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.6") (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      };
    }