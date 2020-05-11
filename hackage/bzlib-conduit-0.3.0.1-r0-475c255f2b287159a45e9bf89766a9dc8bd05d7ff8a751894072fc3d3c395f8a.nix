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
      identifier = { name = "bzlib-conduit"; version = "0.3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012, Hideyuki Tanaka";
      maintainer = "Michael Snoyman";
      author = "Hideyuki Tanaka";
      homepage = "https://github.com/snoyberg/bzlib-conduit#readme";
      url = "";
      synopsis = "Streaming compression/decompression via conduits.";
      description = "Please see the README and docs at <https://www.stackage.org/package/bzlib-conduit>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          ];
        libs = (pkgs.lib).optional (!system.isWindows) (pkgs."bz2" or (sysDepError "bz2"));
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bzlib-conduit" or (buildDepError "bzlib-conduit"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bzlib-conduit" or (buildDepError "bzlib-conduit"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."data-default-class" or (buildDepError "data-default-class"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            ];
          buildable = true;
          };
        };
      };
    }