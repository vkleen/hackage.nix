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
    flags = { debug = false; enable-botan = false; misc-executables = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "second-transfer"; version = "0.10.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2015, Alcides Viamontes Esquivel";
      maintainer = "alcidesv@zunzun.se";
      author = "Alcides Viamontes Esquivel";
      homepage = "https://www.httptwo.com/second-transfer/";
      url = "";
      synopsis = "Second Transfer HTTP/2 web server";
      description = "Second Transfer HTTP/2 web server";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."hashtables" or (buildDepError "hashtables"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."http2" or (buildDepError "http2"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."clock" or (buildDepError "clock"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."BoundedChan" or (buildDepError "BoundedChan"))
          (hsPkgs."pqueue" or (buildDepError "pqueue"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          ];
        libs = ((pkgs.lib).optionals (system.isOsx) ((pkgs.lib).optional (flags.enable-botan) (pkgs."second_transfer__enable_tls" or (sysDepError "second_transfer__enable_tls"))) ++ (pkgs.lib).optional (system.isLinux) (pkgs."stdc++" or (sysDepError "stdc++"))) ++ (pkgs.lib).optionals (flags.enable-botan) ((pkgs.lib).optional (system.isLinux) (pkgs."botan-1.11" or (sysDepError "botan-1.11")));
        build-tools = [
          (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (buildToolDepError "cpphs")))
          ];
        buildable = true;
        };
      tests = {
        "hunit-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."http2" or (buildDepError "http2"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."hashtables" or (buildDepError "hashtables"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."second-transfer" or (buildDepError "second-transfer"))
            (hsPkgs."stm" or (buildDepError "stm"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (buildToolDepError "cpphs")))
            ];
          buildable = true;
          };
        };
      };
    }