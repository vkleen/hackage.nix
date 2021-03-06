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
    flags = { threaded = true; gpl = true; ghc-lib = false; };
    package = {
      specVersion = "1.18";
      identifier = { name = "hlint"; version = "3.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2006-2020";
      maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "https://github.com/ndmitchell/hlint#readme";
      url = "";
      synopsis = "Source code suggestions";
      description = "HLint gives suggestions on how to improve your source code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."cpphs" or (buildDepError "cpphs"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."refact" or (buildDepError "refact"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."filepattern" or (buildDepError "filepattern"))
          (hsPkgs."ghc-lib-parser-ex" or (buildDepError "ghc-lib-parser-ex"))
          ] ++ (if !flags.ghc-lib && (compiler.isGhc && (compiler.version).ge "8.10.0") && (compiler.isGhc && (compiler.version).lt "8.11.0")
          then [
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."ghc-boot-th" or (buildDepError "ghc-boot-th"))
            (hsPkgs."ghc-boot" or (buildDepError "ghc-boot"))
            ]
          else [
            (hsPkgs."ghc-lib-parser" or (buildDepError "ghc-lib-parser"))
            ])) ++ (pkgs.lib).optional (flags.gpl) (hsPkgs."hscolour" or (buildDepError "hscolour"));
        buildable = true;
        };
      exes = {
        "hlint" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hlint" or (buildDepError "hlint"))
            ];
          buildable = true;
          };
        };
      };
    }