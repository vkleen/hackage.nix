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
    flags = { split-base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "haskelldb-hdbc-sqlite3"; version = "0.13"; };
      license = "BSD-3-Clause";
      copyright = "The authors";
      maintainer = "haskelldb-users@lists.sourceforge.net";
      author = "Daan Leijen, Conny Andersson, Martin Andersson, Mary Bergman, Victor Blomqvist, Bjorn Bringert, Anders Hockersten, Torbjorn Martin, Jeremy Shaw";
      homepage = "";
      url = "";
      synopsis = "HaskellDB support for the HDBC SQLite driver.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."haskelldb" or (buildDepError "haskelldb"))
          (hsPkgs."haskelldb-hdbc" or (buildDepError "haskelldb-hdbc"))
          (hsPkgs."HDBC" or (buildDepError "HDBC"))
          (hsPkgs."HDBC-sqlite3" or (buildDepError "HDBC-sqlite3"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      exes = { "DBDirect-hdbc-sqlite3" = { buildable = true; }; };
      };
    }