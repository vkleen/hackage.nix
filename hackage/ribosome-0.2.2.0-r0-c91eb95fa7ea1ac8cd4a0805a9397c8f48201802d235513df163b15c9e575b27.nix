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
      specVersion = "1.12";
      identifier = { name = "ribosome"; version = "0.2.2.0"; };
      license = "MIT";
      copyright = "2019 Torsten Schmits";
      maintainer = "tek@tryp.io";
      author = "Torsten Schmits";
      homepage = "https://github.com/tek/ribosome-hs#readme";
      url = "";
      synopsis = "api extensions for nvim-hs";
      description = "Please see the README on GitHub at <https://github.com/tek/proteome-hs>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."messagepack" or (buildDepError "messagepack"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."nvim-hs" or (buildDepError "nvim-hs"))
          (hsPkgs."pretty-terminal" or (buildDepError "pretty-terminal"))
          (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
          (hsPkgs."prettyprinter-ansi-terminal" or (buildDepError "prettyprinter-ansi-terminal"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."typed-process" or (buildDepError "typed-process"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      tests = {
        "ribosome-functional" = {
          depends = [
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."messagepack" or (buildDepError "messagepack"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."nvim-hs" or (buildDepError "nvim-hs"))
            (hsPkgs."pretty-terminal" or (buildDepError "pretty-terminal"))
            (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
            (hsPkgs."prettyprinter-ansi-terminal" or (buildDepError "prettyprinter-ansi-terminal"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."ribosome" or (buildDepError "ribosome"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."typed-process" or (buildDepError "typed-process"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."unliftio" or (buildDepError "unliftio"))
            (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        "ribosome-unit" = {
          depends = [
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."messagepack" or (buildDepError "messagepack"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."nvim-hs" or (buildDepError "nvim-hs"))
            (hsPkgs."pretty-terminal" or (buildDepError "pretty-terminal"))
            (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
            (hsPkgs."prettyprinter-ansi-terminal" or (buildDepError "prettyprinter-ansi-terminal"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."ribosome" or (buildDepError "ribosome"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."typed-process" or (buildDepError "typed-process"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."unliftio" or (buildDepError "unliftio"))
            (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        };
      };
    }