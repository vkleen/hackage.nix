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
    flags = { examples = false; };
    package = {
      specVersion = "1.12";
      identifier = { name = "servant-to-elm"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Olle Fredriksson";
      maintainer = "fredriksson.olle@gmail.com";
      author = "Olle Fredriksson";
      homepage = "https://github.com/folq/servant-to-elm#readme";
      url = "";
      synopsis = "Automatically generate Elm clients for Servant APIs";
      description = "Please see the README on GitHub at <https://github.com/folq/servant-to-elm#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bound" or (buildDepError "bound"))
          (hsPkgs."elm-syntax" or (buildDepError "elm-syntax"))
          (hsPkgs."haskell-to-elm" or (buildDepError "haskell-to-elm"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."protolude" or (buildDepError "protolude"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-multipart" or (buildDepError "servant-multipart"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "user-example" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bound" or (buildDepError "bound"))
            (hsPkgs."elm-syntax" or (buildDepError "elm-syntax"))
            (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
            (hsPkgs."haskell-to-elm" or (buildDepError "haskell-to-elm"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-multipart" or (buildDepError "servant-multipart"))
            (hsPkgs."servant-to-elm" or (buildDepError "servant-to-elm"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = if !flags.examples then false else true;
          };
        };
      tests = {
        "servant-to-elm-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bound" or (buildDepError "bound"))
            (hsPkgs."elm-syntax" or (buildDepError "elm-syntax"))
            (hsPkgs."haskell-to-elm" or (buildDepError "haskell-to-elm"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-multipart" or (buildDepError "servant-multipart"))
            (hsPkgs."servant-to-elm" or (buildDepError "servant-to-elm"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }