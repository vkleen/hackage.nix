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
      identifier = { name = "amazonka-kms"; version = "1.3.2"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013-2015 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "https://github.com/brendanhay/amazonka";
      url = "";
      synopsis = "Amazon Key Management Service SDK.";
      description = "AWS Key Management Service\nAWS Key Management Service (KMS) is an encryption and key management web\nservice. This guide describes the KMS actions that you can call\nprogrammatically. For general information about KMS, see the\n<http://docs.aws.amazon.com/kms/latest/developerguide/overview.html AWS Key Management Service Developer Guide>\nAWS provides SDKs that consist of libraries and sample code for various\nprogramming languages and platforms (Java, Ruby, .Net, iOS, Android,\netc.). The SDKs provide a convenient way to create programmatic access\nto KMS and AWS. For example, the SDKs take care of tasks such as signing\nrequests (see below), managing errors, and retrying requests\nautomatically. For more information about the AWS SDKs, including how to\ndownload and install them, see\n<http://aws.amazon.com/tools/ Tools for Amazon Web Services>.\nWe recommend that you use the AWS SDKs to make programmatic API calls to\nKMS.\nClients must support TLS (Transport Layer Security) 1.0. We recommend\nTLS 1.2. Clients must also support cipher suites with Perfect Forward\nSecrecy (PFS) such as Ephemeral Diffie-Hellman (DHE) or Elliptic Curve\nEphemeral Diffie-Hellman (ECDHE). Most modern systems such as Java 7 and\nlater support these modes.\n__Signing Requests__\nRequests must be signed by using an access key ID and a secret access\nkey. We strongly recommend that you do not use your AWS account access\nkey ID and secret key for everyday work with KMS. Instead, use the\naccess key ID and secret access key for an IAM user, or you can use the\nAWS Security Token Service to generate temporary security credentials\nthat you can use to sign requests.\nAll KMS operations require\n<http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html Signature Version 4>.\n__Recording API Requests__\nKMS supports AWS CloudTrail, a service that records AWS API calls and\nrelated events for your AWS account and delivers them to an Amazon S3\nbucket that you specify. By using the information collected by\nCloudTrail, you can determine what requests were made to KMS, who made\nthe request, when it was made, and so on. To learn more about\nCloudTrail, including how to turn it on and find your log files, see the\n<http://docs.aws.amazon.com/awscloudtrail/latest/userguide/whatiscloudtrail.html AWS CloudTrail User Guide>\n__Additional Resources__\nFor more information about credentials and request signing, see the\nfollowing:\n-   <http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html AWS Security Credentials>.\nThis topic provides general information about the types of\ncredentials used for accessing AWS.\n-   <http://docs.aws.amazon.com/STS/latest/UsingSTS/ AWS Security Token Service>.\nThis guide describes how to create and use temporary security\ncredentials.\n-   <http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html Signing AWS API Requests>.\nThis set of topics walks you through the process of signing a\nrequest using an access key ID and a secret access key.\n__Commonly Used APIs__\nOf the APIs discussed in this guide, the following will prove the most\nuseful for most applications. You will likely perform actions other than\nthese, such as creating keys and assigning policies, by using the\nconsole.\n-   Encrypt\n-   Decrypt\n-   GenerateDataKey\n-   GenerateDataKeyWithoutPlaintext\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.KMS\" and the <http://docs.aws.amazon.com/kms/latest/APIReference/Welcome.html AWS API Reference>\nto get started.";
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
        "amazonka-kms-test" = {
          depends = [
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."amazonka-test" or (buildDepError "amazonka-test"))
            (hsPkgs."amazonka-kms" or (buildDepError "amazonka-kms"))
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