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
      identifier = { name = "amazonka-glacier"; version = "1.2.0.2"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013-2015 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "https://github.com/brendanhay/amazonka";
      url = "";
      synopsis = "Amazon Glacier SDK.";
      description = "Amazon Glacier is a storage solution for \\\"cold data.\\\"\nAmazon Glacier is an extremely low-cost storage service that provides\nsecure, durable, and easy-to-use storage for data backup and archival.\nWith Amazon Glacier, customers can store their data cost effectively for\nmonths, years, or decades. Amazon Glacier also enables customers to\noffload the administrative burdens of operating and scaling storage to\nAWS, so they don\\'t have to worry about capacity planning, hardware\nprovisioning, data replication, hardware failure and recovery, or\ntime-consuming hardware migrations.\nAmazon Glacier is a great storage choice when low storage cost is\nparamount, your data is rarely retrieved, and retrieval latency of\nseveral hours is acceptable. If your application requires fast or\nfrequent access to your data, consider using Amazon S3. For more\ninformation, go to\n<http://aws.amazon.com/s3/ Amazon Simple Storage Service (Amazon S3)>.\nYou can store any kind of data in any format. There is no maximum limit\non the total amount of data you can store in Amazon Glacier.\nIf you are a first-time user of Amazon Glacier, we recommend that you\nbegin by reading the following sections in the /Amazon Glacier Developer\nGuide/:\n-   <http://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html What is Amazon Glacier>\n- This section of the Developer Guide describes the underlying data\nmodel, the operations it supports, and the AWS SDKs that you can use\nto interact with the service.\n-   <http://docs.aws.amazon.com/amazonglacier/latest/dev/amazon-glacier-getting-started.html Getting Started with Amazon Glacier>\n- The Getting Started section walks you through the process of\ncreating a vault, uploading archives, creating jobs to download\narchives, retrieving the job output, and deleting archives.\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.Glacier\" and the <http://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html AWS API Reference>\nto get started.";
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
        "amazonka-glacier-test" = {
          depends = [
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."amazonka-test" or (buildDepError "amazonka-test"))
            (hsPkgs."amazonka-glacier" or (buildDepError "amazonka-glacier"))
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