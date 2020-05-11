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
      identifier = { name = "feed-gipeda"; version = "0.3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2016 Sebastian Graf";
      maintainer = "sgraf1337@gmail.com";
      author = "Sebastian Graf";
      homepage = "http://github.com/sgraf812/feed-gipeda#readme";
      url = "";
      synopsis = "CI service around gipeda";
      description = "A service for easy handling of multiple repositories with\n<https://hackage.haskell.org/package/gipeda gipeda>.\n\nSee @--help@ for usage. Example invocation for benchmarking the whole of the\n@Pipes@ library:\n\n@\n\$ cat > feed-gipeda.yaml\nrepositories:\n- https:\\/\\/github.com\\/Gabriel439\\/Haskell-Pipes-Library\n^D\n\$ feed-gipeda --config=.\\/feed-gipeda.yaml --deploy-to=.\\/website\n@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."data-hash" or (buildDepError "data-hash"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."distributed-process" or (buildDepError "distributed-process"))
          (hsPkgs."distributed-process-extras" or (buildDepError "distributed-process-extras"))
          (hsPkgs."distributed-process-client-server" or (buildDepError "distributed-process-client-server"))
          (hsPkgs."distributed-process-async" or (buildDepError "distributed-process-async"))
          (hsPkgs."distributed-process-p2p" or (buildDepError "distributed-process-p2p"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."reactive-banana" or (buildDepError "reactive-banana"))
          (hsPkgs."logging" or (buildDepError "logging"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."concurrent-extra" or (buildDepError "concurrent-extra"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."SafeSemaphore" or (buildDepError "SafeSemaphore"))
          ];
        buildable = true;
        };
      exes = {
        "feed-gipeda" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."feed-gipeda" or (buildDepError "feed-gipeda"))
            (hsPkgs."extra" or (buildDepError "extra"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."logging" or (buildDepError "logging"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-smallcheck" or (buildDepError "tasty-smallcheck"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-hspec" or (buildDepError "tasty-hspec"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."feed-gipeda" or (buildDepError "feed-gipeda"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."managed" or (buildDepError "managed"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."logging" or (buildDepError "logging"))
            ];
          buildable = true;
          };
        };
      };
    }