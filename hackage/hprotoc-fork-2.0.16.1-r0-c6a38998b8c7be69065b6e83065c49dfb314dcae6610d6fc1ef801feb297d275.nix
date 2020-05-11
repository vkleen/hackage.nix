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
    flags = { small_base = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "hprotoc-fork"; version = "2.0.16.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2008-2012 Christopher Edward Kuklewicz";
      maintainer = "Stefan Wehr <wehr@cp-med.com>";
      author = "Christopher Edward Kuklewicz";
      homepage = "http://darcs.factisresearch.com/pub/protocol-buffers-fork/";
      url = "http://hackage.haskell.org/package/hprotoc-fork";
      synopsis = "Parse Google Protocol Buffer specifications";
      description = "Parse language defined at <http://code.google.com/apis/protocolbuffers/docs/proto.html> and general haskell code to implement messages. This is a fork of the hprotoc library at http://hackage.haskell.org/package/hprotoc";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."protocol-buffers-fork" or (buildDepError "protocol-buffers-fork"))
          (hsPkgs."protocol-buffers-descriptor-fork" or (buildDepError "protocol-buffers-descriptor-fork"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        build-tools = [
          (hsPkgs.buildPackages.alex or (pkgs.buildPackages.alex or (buildToolDepError "alex")))
          ];
        buildable = true;
        };
      exes = {
        "hprotoc" = {
          depends = [
            (hsPkgs."protocol-buffers-fork" or (buildDepError "protocol-buffers-fork"))
            (hsPkgs."protocol-buffers-descriptor-fork" or (buildDepError "protocol-buffers-descriptor-fork"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
          build-tools = [
            (hsPkgs.buildPackages.alex or (pkgs.buildPackages.alex or (buildToolDepError "alex")))
            ];
          buildable = true;
          };
        };
      };
    }