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
    flags = { graphics = false; };
    package = {
      specVersion = "1.24";
      identifier = { name = "haskell-igraph"; version = "0.2.1"; };
      license = "MIT";
      copyright = "(c) 2016 Kai Zhang";
      maintainer = "kai@kzhang.org";
      author = "Kai Zhang";
      homepage = "";
      url = "";
      synopsis = "Imcomplete igraph bindings";
      description = "This is an attempt to create a complete bindings for the\nigraph<\"http://igraph.org/c/\"> library. Related work:\nhttps://hackage.haskell.org/package/igraph.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."bytestring-lexing" or (buildDepError "bytestring-lexing"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."hxt" or (buildDepError "hxt"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          ] ++ (pkgs.lib).optionals (flags.graphics) [
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
          ];
        libs = [ (pkgs."igraph" or (sysDepError "igraph")) ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell-igraph" or (buildDepError "haskell-igraph"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."random" or (buildDepError "random"))
            ];
          buildable = true;
          };
        };
      };
    }