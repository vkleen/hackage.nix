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
      specVersion = "1.8.0.2";
      identifier = { name = "annah"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2015 Gabriel Gonzalez";
      maintainer = "Gabriel439@gmail.com";
      author = "Gabriel Gonzalez";
      homepage = "";
      url = "";
      synopsis = "Medium-level language that desugars to Morte";
      description = "Annah is a very simple statically typed and purely functional\nlambda calculus with built-in support for:\n\n* imports via embedding remote expressions\n\n* mutually recursive data types\n\n* let expressions\n\n* natural numbers\n\n* lists\n\n* free monads\n\n* free categories\n\nAnnah is built on top of Morte (a minimalist calculus of constructions),\nmeaning that all language features that Annah provides are desugared to\na pure non-recursive lambda calculus.\n\nRead the \"Annah.Tutorial\" module to learn more about how to program using\nAnnah.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."Earley" or (buildDepError "Earley"))
          (hsPkgs."lens-family-core" or (buildDepError "lens-family-core"))
          (hsPkgs."morte" or (buildDepError "morte"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-format" or (buildDepError "text-format"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.alex or (pkgs.buildPackages.alex or (buildToolDepError "alex")))
          ];
        buildable = true;
        };
      exes = {
        "annah" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."annah" or (buildDepError "annah"))
            (hsPkgs."morte" or (buildDepError "morte"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }