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
      identifier = { name = "amazonka-iam"; version = "1.3.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013-2015 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "https://github.com/brendanhay/amazonka";
      url = "";
      synopsis = "Amazon Identity and Access Management SDK.";
      description = "AWS Identity and Access Management\nAWS Identity and Access Management (IAM) is a web service that you can\nuse to manage users and user permissions under your AWS account. This\nguide provides descriptions of IAM actions that you can call\nprogrammatically. For general information about IAM, see\n<http://aws.amazon.com/iam/ AWS Identity and Access Management (IAM)>.\nFor the user guide for IAM, see\n<http://docs.aws.amazon.com/IAM/latest/UserGuide/ Using IAM>.\nAWS provides SDKs that consist of libraries and sample code for various\nprogramming languages and platforms (Java, Ruby, .NET, iOS, Android,\netc.). The SDKs provide a convenient way to create programmatic access\nto IAM and AWS. For example, the SDKs take care of tasks such as\ncryptographically signing requests (see below), managing errors, and\nretrying requests automatically. For information about the AWS SDKs,\nincluding how to download and install them, see the\n<http://aws.amazon.com/tools/ Tools for Amazon Web Services> page.\nWe recommend that you use the AWS SDKs to make programmatic API calls to\nIAM. However, you can also use the IAM Query API to make direct calls to\nthe IAM web service. To learn more about the IAM Query API, see\n<http://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html Making Query Requests>\nin the /Using IAM/ guide. IAM supports GET and POST requests for all\nactions. That is, the API does not require you to use GET for some\nactions and POST for others. However, GET requests are subject to the\nlimitation size of a URL. Therefore, for operations that require larger\nsizes, use a POST request.\n__Signing Requests__\nRequests must be signed using an access key ID and a secret access key.\nWe strongly recommend that you do not use your AWS account access key ID\nand secret access key for everyday work with IAM. You can use the access\nkey ID and secret access key for an IAM user or you can use the AWS\nSecurity Token Service to generate temporary security credentials and\nuse those to sign requests.\nTo sign requests, we recommend that you use\n<http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html Signature Version 4>.\nIf you have an existing application that uses Signature Version 2, you\ndo not have to update it to use Signature Version 4. However, some\noperations now require Signature Version 4. The documentation for\noperations that require version 4 indicate this requirement.\n__Additional Resources__\nFor more information, see the following:\n-   <http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html AWS Security Credentials>.\nThis topic provides general information about the types of\ncredentials used for accessing AWS.\n-   <http://docs.aws.amazon.com/IAM/latest/UserGuide/IAMBestPractices.html IAM Best Practices>.\nThis topic presents a list of suggestions for using the IAM service\nto help secure your AWS resources.\n-   <http://docs.aws.amazon.com/STS/latest/UsingSTS/ AWS Security Token Service>.\nThis guide describes how to create and use temporary security\ncredentials.\n-   <http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html Signing AWS API Requests>.\nThis set of topics walk you through the process of signing a request\nusing an access key ID and secret access key.\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.IAM\" and the <http://docs.aws.amazon.com/IAM/latest/APIReference/Welcome.html AWS API Reference>\nto get started.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      tests = {
        "amazonka-iam-test" = {
          depends = [
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."amazonka-test" or (buildDepError "amazonka-test"))
            (hsPkgs."amazonka-iam" or (buildDepError "amazonka-iam"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }