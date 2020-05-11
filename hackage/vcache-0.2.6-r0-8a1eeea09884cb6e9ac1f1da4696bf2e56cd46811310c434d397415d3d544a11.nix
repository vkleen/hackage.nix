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
      specVersion = "1.16.0.3";
      identifier = { name = "vcache"; version = "0.2.6"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014-2015 by David Barbour";
      maintainer = "dmbarbour@gmail.com";
      author = "David Barbour";
      homepage = "http://github.com/dmbarbour/haskell-vcache";
      url = "";
      synopsis = "semi-transparent persistence for Haskell using LMDB, STM";
      description = "VCache provides a nearly-transparent persistent memory for Haskell\nsupporting ACID transactional variables and large structured values.\nThe virtual address space is modeled above a memory mapped file via\nLMDB, with structure sharing and incremental reference counting GC.\n\nVCache was developed as an alternative to acid-state in a context where\nthe persistent data is much bigger than the active working set and RAM.\nOther similar packages include TCache and perdure. See the home page\nfor a simple comparison.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."direct-murmur-hash" or (buildDepError "direct-murmur-hash"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."lmdb" or (buildDepError "lmdb"))
          (hsPkgs."filelock" or (buildDepError "filelock"))
          (hsPkgs."easy-file" or (buildDepError "easy-file"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      };
    }