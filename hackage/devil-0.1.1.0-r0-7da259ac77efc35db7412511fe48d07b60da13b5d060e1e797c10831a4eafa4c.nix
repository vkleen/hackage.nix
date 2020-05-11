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
      specVersion = "1.8";
      identifier = { name = "devil"; version = "0.1.1.0"; };
      license = "MIT";
      copyright = "Copyright (c) 2013 Yanhao Zhu.";
      maintainer = "Yanhao Zhu <yanhaozhu@gmail.com>";
      author = "Yanhao Zhu";
      homepage = "https://github.com/luanzhu/devil";
      url = "";
      synopsis = "A small tool to make it easier to update program managed by Angel.";
      description = "@Devil@ is a small tool to make it easier to update programs managed\nby Angel (the excellent process monitor/management tool).  Angel\nstarts processes.  Devil kills running processes when an update is detected.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "devil" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hinotify" or (buildDepError "hinotify"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }