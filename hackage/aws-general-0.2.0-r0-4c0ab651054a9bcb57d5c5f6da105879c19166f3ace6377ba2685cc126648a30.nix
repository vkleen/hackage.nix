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
    flags = { normalize-signature-v4-date = true; old-locale = false; };
    package = {
      specVersion = "1.16";
      identifier = { name = "aws-general"; version = "0.2.0"; };
      license = "MIT";
      copyright = "Copyright (c) 2014 AlephCloud, Inc.";
      maintainer = "Lars Kuhtz <lars@alephcloud.com>";
      author = "Lars Kuhtz <lars@alephcloud.com>";
      homepage = "https://github.com/alephcloud/hs-aws-general";
      url = "";
      synopsis = "Bindings for Amazon Web Services (AWS) General Reference";
      description = "Bindings for Amazon Web Services (AWS) General Reference including AWS Signature V4.\n\n/API Version: 1.0/\n\n<http://docs.aws.amazon.com/general/latest/gr/>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."parsers" or (buildDepError "parsers"))
          (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ] ++ (if flags.old-locale
          then [
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            ]
          else [ (hsPkgs."time" or (buildDepError "time")) ]);
        buildable = true;
        };
      tests = {
        "signature-v4" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aws" or (buildDepError "aws"))
            (hsPkgs."aws-general" or (buildDepError "aws-general"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."parsers" or (buildDepError "parsers"))
            (hsPkgs."charset" or (buildDepError "charset"))
            (hsPkgs."errors" or (buildDepError "errors"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            ];
          buildable = true;
          };
        };
      };
    }