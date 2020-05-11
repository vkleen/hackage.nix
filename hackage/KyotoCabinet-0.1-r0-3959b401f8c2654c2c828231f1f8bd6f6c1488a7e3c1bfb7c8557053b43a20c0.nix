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
      specVersion = "1.4";
      identifier = { name = "KyotoCabinet"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2011 Warren Harris, (c) 2011 Google Inc.";
      maintainer = "Warren Harris <warrenharris@google.com>";
      author = "Warren Harris <warrenharris@google.com>";
      homepage = "https://code.google.com/p/kyotocabinet-hs/";
      url = "";
      synopsis = "Kyoto Cabinet DB bindings";
      description = "Kyoto Cabinet is a library of routines for managing a\ndatabase. The database is a simple data file containing records,\neach is a pair of a key and a value. Every key and value is serial\nbytes with variable length. Both binary data and character string\ncan be used as a key and a value. Each key must be unique within a\ndatabase. There is neither concept of data tables nor data\ntypes. Records are organized in hash table or B+ tree.\n\nKyoto Cabinet runs very fast. For example, elapsed time to store\none million records is 0.9 seconds for hash database, and 1.1\nseconds for B+ tree database. Moreover, the size of database is\nvery small. For example, overhead for a record is 16 bytes for\nhash database, and 4 bytes for B+ tree database. Furthermore,\nscalability of Kyoto Cabinet is great. The database size can be up\nto 8EB (9.22e18 bytes).\n\nKyoto Cabinet is written in the C++ language, and provided as API\nof C++, C, Java, Python, Ruby, Perl, Lua and Haskell. Kyoto Cabinet is\navailable on platforms which have API conforming to C++03 with the\nTR1 library extensions. Kyoto Cabinet is a free software licensed\nunder the GNU General Public License. On the other hand, a\ncommercial license is also provided. If you use Kyoto Cabinet\nwithin a proprietary software, the commercial license is required.\n\nKyoto Cabinet home page:\n<http://fallabs.com/kyotocabinet/>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        libs = [ (pkgs."kyotocabinet" or (sysDepError "kyotocabinet")) ];
        buildable = true;
        };
      };
    }