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
    flags = { test = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "fay"; version = "0.20.1.4"; };
      license = "BSD-3-Clause";
      copyright = "2012 Chris Done, Adam Bergmark";
      maintainer = "adam@bergmark.nl";
      author = "Chris Done, Adam Bergmark";
      homepage = "https://github.com/faylang/fay/wiki";
      url = "";
      synopsis = "A compiler for Fay, a Haskell subset that compiles to JavaScript.";
      description = "Fay is a proper subset of Haskell which is type-checked\nwith GHC, and compiled to JavaScript. It is lazy, pure, has a Fay monad,\nan FFI, tail-recursion optimization (experimental), and support for cabal packages.\n\n/Documentation/\n\nSee <https://github.com/faylang/fay/wiki>\n\n/Examples/\n\nSee the examples directory and <https://github.com/faylang/fay/wiki#fay-in-the-wild>\n";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."haskell-names" or (buildDepError "haskell-names"))
          (hsPkgs."haskell-packages" or (buildDepError "haskell-packages"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."language-ecmascript" or (buildDepError "language-ecmascript"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."sourcemap" or (buildDepError "sourcemap"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."spoon" or (buildDepError "spoon"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      exes = {
        "fay" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fay" or (buildDepError "fay"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."split" or (buildDepError "split"))
            ];
          buildable = true;
          };
        "fay-tests" = {
          depends = (pkgs.lib).optionals (flags.test) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fay" or (buildDepError "fay"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."groom" or (buildDepError "groom"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = if flags.test then true else false;
          };
        };
      };
    }