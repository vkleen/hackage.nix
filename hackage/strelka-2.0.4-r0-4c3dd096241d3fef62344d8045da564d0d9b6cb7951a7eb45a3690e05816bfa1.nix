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
      identifier = { name = "strelka"; version = "2.0.4"; };
      license = "MIT";
      copyright = "(c) 2016, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/strelka";
      url = "";
      synopsis = "A simple, flexible and composable web-router";
      description = "An HTTP server can be defined as a request parser, which produces a response,\nwhile managing the application state.\nAs simple as that.\nThis library exploits that fact to produce a very simple and flexible API,\nwhich can be executed on top of any specific HTTP-server implementation (e.g., Warp).\n\n[Library Structure]\nThe API is split into a set of DSLs targeted at solving specific problems in isolation,\nthus facilitating a proper separation of concerns.\n\n[Server Bindings]\nCurrently only a binding to WAI and Warp is known:\n<http://hackage.haskell.org/package/strelka-wai>.\n\n[Demo]\nFor a thorough demonstration of the library and suggested usage patterns\ncheck out the following project:\n<https://github.com/nikita-volkov/strelka-demo>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."attoparsec-data" or (buildDepError "attoparsec-data"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."bytestring-tree-builder" or (buildDepError "bytestring-tree-builder"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."http-media" or (buildDepError "http-media"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."strelka-core" or (buildDepError "strelka-core"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-builder" or (buildDepError "text-builder"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."url-decoders" or (buildDepError "url-decoders"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          ];
        buildable = true;
        };
      };
    }