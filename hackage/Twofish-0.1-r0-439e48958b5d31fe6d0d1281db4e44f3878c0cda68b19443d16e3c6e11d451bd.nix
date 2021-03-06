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
      specVersion = "1.2";
      identifier = { name = "Twofish"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ron.leisti@gmail.com";
      author = "Ron Leisti";
      homepage = "";
      url = "";
      synopsis = "An implementation of the Twofish Symmetric-key cipher.";
      description = "Implements the Twofish symmetric block cipher, designed by:\nBruce Schneier, John Kelsey, Doug Whiting, David Wagner, Chris Hall,\nand Niels Ferguson.\nAs well, this module includes some generic definitions for\nciphers and cipher-block-chaining mode, in the Data.Cipher\nmodule.  In the future, these should probably either be\nmoved to their own package, or all of this should be merged\ninto the Crypto package.\nAcknowledgments:\nDominic Steinitz and Creighton Hogg for their work on the Crypto\npackage, upon which this package depends (particularily for the\nData.LargeWord module).\nStephen Tetley for his advice and code examples provided on\nthe Haskell-Beginners mailing list, in response to a question\nI had, which helped me to create a transformer version of the Cbc monad.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Crypto" or (buildDepError "Crypto"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      exes = { "Test" = { buildable = true; }; };
      };
    }