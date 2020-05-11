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
    flags = {
      curl = true;
      http = true;
      network-uri = true;
      static = false;
      terminfo = true;
      threaded = true;
      library = true;
      executable = true;
      color = true;
      mmap = true;
      hpc = false;
      test = false;
      optimize = true;
      warn-as-error = false;
      force-char8-encoding = false;
      libiconv = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "darcs"; version = "2.8.5"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "<darcs-devel@darcs.net>";
      author = "David Roundy <droundy@darcs.net>, <darcs-devel@darcs.net>";
      homepage = "http://darcs.net/";
      url = "";
      synopsis = "a distributed, interactive, smart revision control system";
      description = "Darcs is a free, open source revision control\nsystem. It is:\n\n* Distributed: Every user has access to the full\ncommand set, removing boundaries between server and\nclient or committer and non-committers.\n\n* Interactive: Darcs is easy to learn and efficient to\nuse because it asks you questions in response to\nsimple commands, giving you choices in your work\nflow. You can choose to record one change in a file,\nwhile ignoring another. As you update from upstream,\nyou can review each patch name, even the full \"diff\"\nfor interesting patches.\n\n* Smart: Originally developed by physicist David\nRoundy, darcs is based on a unique algebra of\npatches.\n\nThis smartness lets you respond to changing demands\nin ways that would otherwise not be possible. Learn\nmore about spontaneous branches with darcs.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = (pkgs.lib).optionals (!(!flags.library)) ((((((([
          (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."html" or (buildDepError "html"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."hashed-storage" or (buildDepError "hashed-storage"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."tar" or (buildDepError "tar"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ] ++ (if system.isWindows
          then [
            (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
            (hsPkgs."Win32" or (buildDepError "Win32"))
            (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
            ]
          else [
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ])) ++ [
          (hsPkgs."base" or (buildDepError "base"))
          ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.0") (hsPkgs."haskeline" or (buildDepError "haskeline"))) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"))) ++ (pkgs.lib).optionals (flags.http) ([
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          ] ++ (if flags.network-uri
          then [
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            ]
          else [
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."network" or (buildDepError "network"))
            ]))) ++ (pkgs.lib).optional (flags.mmap && !system.isWindows) (hsPkgs."mmap" or (buildDepError "mmap"))) ++ (pkgs.lib).optional (flags.terminfo && !system.isWindows) (hsPkgs."terminfo" or (buildDepError "terminfo")));
        libs = (pkgs.lib).optionals (!(!flags.library)) ((pkgs.lib).optional (flags.curl) (pkgs."curl" or (sysDepError "curl")));
        build-tools = (pkgs.lib).optional (!(!flags.library)) (hsPkgs.buildPackages.ghc or (pkgs.buildPackages.ghc or (buildToolDepError "ghc")));
        buildable = if !flags.library
          then false
          else if !flags.curl && !flags.http then false else true;
        };
      exes = {
        "darcs" = {
          depends = (((((([
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."html" or (buildDepError "html"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."hashed-storage" or (buildDepError "hashed-storage"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ] ++ (if system.isWindows
            then [
              (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
              (hsPkgs."Win32" or (buildDepError "Win32"))
              (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
              ]
            else [
              (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
              ])) ++ [
            (hsPkgs."base" or (buildDepError "base"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.0") (hsPkgs."haskeline" or (buildDepError "haskeline"))) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"))) ++ (pkgs.lib).optionals (flags.http) ([
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            ] ++ (if flags.network-uri
            then [
              (hsPkgs."network" or (buildDepError "network"))
              (hsPkgs."network-uri" or (buildDepError "network-uri"))
              ]
            else [
              (hsPkgs."network" or (buildDepError "network"))
              (hsPkgs."network" or (buildDepError "network"))
              ]))) ++ (pkgs.lib).optional (flags.mmap && !system.isWindows) (hsPkgs."mmap" or (buildDepError "mmap"))) ++ (pkgs.lib).optional (flags.terminfo && !system.isWindows) (hsPkgs."terminfo" or (buildDepError "terminfo"));
          libs = (pkgs.lib).optional (flags.curl) (pkgs."curl" or (sysDepError "curl"));
          build-tools = [
            (hsPkgs.buildPackages.ghc or (pkgs.buildPackages.ghc or (buildToolDepError "ghc")))
            ];
          buildable = (if !flags.executable
            then false
            else true) && (if !flags.curl && !flags.http then false else true);
          };
        "darcs-test" = {
          depends = (pkgs.lib).optionals (!(!flags.test)) ((((((([
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."html" or (buildDepError "html"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."FindBin" or (buildDepError "FindBin"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."cmdlib" or (buildDepError "cmdlib"))
            (hsPkgs."shellish" or (buildDepError "shellish"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."hashed-storage" or (buildDepError "hashed-storage"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            ] ++ (if system.isWindows
            then [
              (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
              (hsPkgs."Win32" or (buildDepError "Win32"))
              (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
              ]
            else [
              (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
              ])) ++ [
            (hsPkgs."base" or (buildDepError "base"))
            ]) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "7.0") (hsPkgs."haskeline" or (buildDepError "haskeline"))) ++ (pkgs.lib).optional (flags.mmap && !system.isWindows) (hsPkgs."mmap" or (buildDepError "mmap"))) ++ (pkgs.lib).optional (flags.terminfo && !system.isWindows) (hsPkgs."terminfo" or (buildDepError "terminfo"))) ++ (pkgs.lib).optionals (flags.http) ([
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            ] ++ (if flags.network-uri
            then [
              (hsPkgs."network" or (buildDepError "network"))
              (hsPkgs."network-uri" or (buildDepError "network-uri"))
              ]
            else [
              (hsPkgs."network" or (buildDepError "network"))
              (hsPkgs."network" or (buildDepError "network"))
              ])));
          libs = (pkgs.lib).optionals (!(!flags.test)) ((pkgs.lib).optional (flags.curl) (pkgs."curl" or (sysDepError "curl")));
          build-tools = [
            (hsPkgs.buildPackages.ghc or (pkgs.buildPackages.ghc or (buildToolDepError "ghc")))
            ];
          buildable = if !flags.test then false else true;
          };
        };
      };
    }