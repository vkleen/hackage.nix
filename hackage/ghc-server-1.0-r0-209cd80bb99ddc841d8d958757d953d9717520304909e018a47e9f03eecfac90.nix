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
      identifier = { name = "ghc-server"; version = "1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "chrisdone@gmail.com";
      author = "Chris Done";
      homepage = "";
      url = "";
      synopsis = "A server interface to GHC.";
      description = "A server interface to GHC.\nSupported major GHC versions: 7.4, 7.6, 7.8";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (pkgs.lib).optional (compiler.isGhc && false) (hsPkgs."ghc" or (buildDepError "ghc")) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "7.4") [
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."atto-lisp" or (buildDepError "atto-lisp"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          ];
        buildable = true;
        };
      exes = {
        "ghc-server" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-server" or (buildDepError "ghc-server"))
            (hsPkgs."network" or (buildDepError "network"))
            ];
          buildable = true;
          };
        };
      };
    }