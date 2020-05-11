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
      identifier = { name = "Gamgine"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "daniel.trstenjak@gmail.com";
      author = "Daniel Trstenjak";
      homepage = "";
      url = "";
      synopsis = "Some kind of game library or set of utilities.";
      description = "Some kind of game library or set of utilities, which are mostly/certainly only usable for my own toy projects.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."GLFW-b" or (buildDepError "GLFW-b"))
          (hsPkgs."OpenGLRaw" or (buildDepError "OpenGLRaw"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."Vec" or (buildDepError "Vec"))
          (hsPkgs."utility-ht" or (buildDepError "utility-ht"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."StateVar" or (buildDepError "StateVar"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."data-lens" or (buildDepError "data-lens"))
          (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
          (hsPkgs."cpphs" or (buildDepError "cpphs"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."ListZipper" or (buildDepError "ListZipper"))
          (hsPkgs."composition" or (buildDepError "composition"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (buildToolDepError "cpphs")))
          ];
        buildable = true;
        };
      };
    }