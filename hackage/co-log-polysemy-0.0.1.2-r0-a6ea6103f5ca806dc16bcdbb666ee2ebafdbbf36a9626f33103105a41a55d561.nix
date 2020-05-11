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
      specVersion = "2.4";
      identifier = { name = "co-log-polysemy"; version = "0.0.1.2"; };
      license = "MPL-2.0";
      copyright = "2019-2020 Kowainik";
      maintainer = "Kowainik <xrom.xkov@gmail.com>";
      author = "Dmitrii Kovanikov";
      homepage = "https://github.com/kowainik/co-log";
      url = "";
      synopsis = "Composable Contravariant Comonadic Logging Library";
      description = "Implementation of the [co-log](http://hackage.haskell.org/package/co-log-core)\nlogging based on the [polysemy](http://hackage.haskell.org/package/polysemy)\nextensible effects library.\n\nThe ideas behind this package are described in the following blog post:\n\n* [co-log: Composable Contravariant Combinatorial Comonadic Configurable Convenient Logging](https://kowainik.github.io/posts/2018-09-25-co-log)\n\nFor the taggless final implementation of the @co-log@ ideas se the following package:\n\n* [co-log](http://hackage.haskell.org/package/co-log)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."co-log-core" or (buildDepError "co-log-core"))
          (hsPkgs."polysemy" or (buildDepError "polysemy"))
          ];
        buildable = if compiler.isGhc && (compiler.version).lt "8.4"
          then false
          else true;
        };
      exes = {
        "play-colog-poly" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."co-log-core" or (buildDepError "co-log-core"))
            (hsPkgs."co-log-polysemy" or (buildDepError "co-log-polysemy"))
            (hsPkgs."polysemy" or (buildDepError "polysemy"))
            ];
          buildable = if compiler.isGhc && (compiler.version).lt "8.4"
            then false
            else true;
          };
        };
      };
    }