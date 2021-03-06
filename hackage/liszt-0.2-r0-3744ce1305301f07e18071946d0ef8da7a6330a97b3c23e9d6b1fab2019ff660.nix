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
      identifier = { name = "liszt"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2018 Fumiaki Kinoshita";
      maintainer = "fumiexcel@gmail.com";
      author = "Fumiaki Kinoshita";
      homepage = "https://github.com/fumieval/liszt#readme";
      url = "";
      synopsis = "Append only key-list database";
      description = "Please see the README on GitHub at <https://github.com/fumieval/liszt#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cpu" or (buildDepError "cpu"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."sendfile" or (buildDepError "sendfile"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
          (hsPkgs."winery" or (buildDepError "winery"))
          ];
        buildable = true;
        };
      exes = {
        "liszt" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cpu" or (buildDepError "cpu"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."liszt" or (buildDepError "liszt"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."reflection" or (buildDepError "reflection"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."sendfile" or (buildDepError "sendfile"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
            (hsPkgs."winery" or (buildDepError "winery"))
            ];
          buildable = true;
          };
        "lisztd" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cpu" or (buildDepError "cpu"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."liszt" or (buildDepError "liszt"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."reflection" or (buildDepError "reflection"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."sendfile" or (buildDepError "sendfile"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
            (hsPkgs."winery" or (buildDepError "winery"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cpu" or (buildDepError "cpu"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            (hsPkgs."liszt" or (buildDepError "liszt"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."reflection" or (buildDepError "reflection"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."sendfile" or (buildDepError "sendfile"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."stm-delay" or (buildDepError "stm-delay"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-th-unbox" or (buildDepError "vector-th-unbox"))
            (hsPkgs."winery" or (buildDepError "winery"))
            ];
          buildable = true;
          };
        };
      };
    }