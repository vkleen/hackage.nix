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
      specVersion = "0";
      identifier = { name = "Takusen"; version = "0.7"; };
      license = "BSD-3-Clause";
      copyright = "2003-2007, Alistair Bayley, Oleg Kiselyov";
      maintainer = "alistair@abayley.org, oleg@pobox.com";
      author = "Alistair Bayley, Oleg Kiselyov";
      homepage = "http://darcs.haskell.org/takusen";
      url = "http://darcs.haskell.org/takusen";
      synopsis = "Database library with left-fold interface, for PostgreSQL, Oracle, SQLite, ODBC.";
      description = "Takusen is a DBMS access library. It has a backend for Oracle on Unix,\nLinux or Windows via OCI, and a stub to test the library without any database.\nThe infrastructure and the stub let one interface natively with other\ndatabases.\nThe distinguished feature of Takusen is processing query results using a\nleft-fold enumerator.  The user supplies an iteratee function, which receives\nrows one-at-a-time from the result-set.  The number of the arguments to the\niteratee is the number of the columns in the result-set, plus the seed. Each\ncolumn in the result-set has its own Haskell type. The latter could be a Maybe\ntype if the particular iteratee wishes to process NULLs.\nThe benefits are: more convenient and intuitive enumeration, iteration, and\naccumulation (see tests for examples); the retrieved data are not merely\nstrings but have Haskell types: Int, Float, Date, etc.; buffer preallocation;\npre-fetching; support for both enumerators and cursors, proper handling of all\nerrors including various IO errors. No unsafe operations are used.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          ];
        buildable = true;
        };
      };
    }