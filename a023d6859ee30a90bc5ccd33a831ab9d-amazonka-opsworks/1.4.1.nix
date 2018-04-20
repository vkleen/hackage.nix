{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "amazonka-opsworks";
          version = "1.4.1";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "Copyright (c) 2013-2016 Brendan Hay";
        maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
        author = "Brendan Hay";
        homepage = "https://github.com/brendanhay/amazonka";
        url = "";
        synopsis = "Amazon OpsWorks SDK.";
        description = "AWS OpsWorks\nWelcome to the /AWS OpsWorks API Reference/. This guide provides\ndescriptions, syntax, and usage examples about AWS OpsWorks actions and\ndata types, including common parameters and error codes.\nAWS OpsWorks is an application management service that provides an\nintegrated experience for overseeing the complete application lifecycle.\nFor information about this product, go to the\n<http://aws.amazon.com/opsworks/ AWS OpsWorks> details page.\n__SDKs and CLI__\nThe most common way to use the AWS OpsWorks API is by using the AWS\nCommand Line Interface (CLI) or by using one of the AWS SDKs to\nimplement applications in your preferred language. For more information,\nsee:\n-   <http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html AWS CLI>\n-   <http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/opsworks/AWSOpsWorksClient.html AWS SDK for Java>\n-   <http://docs.aws.amazon.com/sdkfornet/latest/apidocs/html/N_Amazon_OpsWorks.htm AWS SDK for .NET>\n-   <http://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.OpsWorks.OpsWorksClient.html AWS SDK for PHP 2>\n-   <http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/OpsWorks/Client.html AWS SDK for Ruby>\n-   <http://aws.amazon.com/documentation/sdkforjavascript/ AWS SDK for Node.js>\n-   <http://docs.pythonboto.org/en/latest/ref/opsworks.html AWS SDK for Python(Boto)>\n__Endpoints__\nAWS OpsWorks supports only one endpoint,\nopsworks.us-east-1.amazonaws.com (HTTPS), so you must connect to that\nendpoint. You can then use the API to direct AWS OpsWorks to create\nstacks in any AWS Region.\n__Chef Versions__\nWhen you call < CreateStack>, < CloneStack>, or < UpdateStack> we\nrecommend you use the @ConfigurationManager@ parameter to specify the\nChef version. The recommended value for Linux stacks is currently 12\n(the default is 11.4). Windows stacks use Chef 12.2. For more\ninformation, see\n<http://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook-chef11.html Chef Versions>.\nYou can specify Chef 12, 11.10, or 11.4 for your Linux stack. We\nrecommend migrating your existing Linux stacks to Chef 12 as soon as\npossible.\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.OpsWorks\" or <https://aws.amazon.com/documentation/ the AWS Documentation>\nto get started.";
        buildType = "Simple";
      };
      components = {
        amazonka-opsworks = {
          depends  = [
            hsPkgs.amazonka-core
            hsPkgs.base
          ];
        };
        tests = {
          amazonka-opsworks-test = {
            depends  = [
              hsPkgs.amazonka-core
              hsPkgs.amazonka-test
              hsPkgs.amazonka-opsworks
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.tasty
              hsPkgs.tasty-hunit
              hsPkgs.text
              hsPkgs.time
              hsPkgs.unordered-containers
            ];
          };
        };
      };
    }