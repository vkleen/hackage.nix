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
      identifier = { name = "minecraft-data"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jeremy@n-heptane.com";
      author = "jeremy@n-heptane.com";
      homepage = "https://github.com/stepcut/minecraft-data";
      url = "";
      synopsis = "a DSL for generating minecraft commands and levels";
      description = "a DSL for generating minecraft commands and levels";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."pipes-bytestring" or (buildDepError "pipes-bytestring"))
          (hsPkgs."pipes-cereal" or (buildDepError "pipes-cereal"))
          (hsPkgs."pipes-parse" or (buildDepError "pipes-parse"))
          (hsPkgs."pipes-zlib" or (buildDepError "pipes-zlib"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."nbt" or (buildDepError "nbt"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-show" or (buildDepError "text-show"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ];
        buildable = true;
        };
      };
    }