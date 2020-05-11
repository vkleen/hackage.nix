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
      identifier = { name = "amazonka-dynamodb"; version = "1.4.3"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013-2016 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "https://github.com/brendanhay/amazonka";
      url = "";
      synopsis = "Amazon DynamoDB SDK.";
      description = "Amazon DynamoDB\nThis is the Amazon DynamoDB API Reference. This guide provides descriptions of the low-level DynamoDB API.\nThis guide is intended for use with the following DynamoDB documentation:\n-   <http://docs.aws.amazon.com/amazondynamodb/latest/gettingstartedguide/ Amazon DynamoDB Getting Started Guide> - provides hands-on exercises that help you learn the basics of working with DynamoDB. /If you are new to DynamoDB, we recommend that you begin with the Getting Started Guide./\n-   <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ Amazon DynamoDB Developer Guide> - contains detailed information about DynamoDB concepts, usage, and best practices.\n-   <http://docs.aws.amazon.com/dynamodbstreams/latest/APIReference/ Amazon DynamoDB Streams API Reference> - provides descriptions and samples of the DynamoDB Streams API. (For more information, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html Capturing Table Activity with DynamoDB Streams> in the Amazon DynamoDB Developer Guide.)\nInstead of making the requests to the low-level DynamoDB API directly from your application, we recommend that you use the AWS Software Development Kits (SDKs). The easy-to-use libraries in the AWS SDKs make it unnecessary to call the low-level DynamoDB API directly from your application. The libraries take care of request authentication, serialization, and connection management. For more information, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSSDK.html Using the AWS SDKs with DynamoDB> in the Amazon DynamoDB Developer Guide.\nIf you decide to code against the low-level DynamoDB API directly, you will need to write the necessary code to authenticate your requests. For more information on signing your requests, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API.html Using the DynamoDB API> in the /Amazon DynamoDB Developer Guide/.\nThe following are short descriptions of each low-level API action, organized by function.\n__Managing Tables__\n-   /CreateTable/ - Creates a table with user-specified provisioned throughput settings. You must define a primary key for the table - either a simple primary key (partition key), or a composite primary key (partition key and sort key). Optionally, you can create one or more secondary indexes, which provide fast data access using non-key attributes.\n-   /DescribeTable/ - Returns metadata for a table, such as table size, status, and index information.\n-   /UpdateTable/ - Modifies the provisioned throughput settings for a table. Optionally, you can modify the provisioned throughput settings for global secondary indexes on the table.\n-   /ListTables/ - Returns a list of all tables associated with the current AWS account and endpoint.\n-   /DeleteTable/ - Deletes a table and all of its indexes.\nFor conceptual information about managing tables, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html Working with Tables> in the /Amazon DynamoDB Developer Guide/.\n__Reading Data__\n-   /GetItem/ - Returns a set of attributes for the item that has a given primary key. By default, /GetItem/ performs an eventually consistent read; however, applications can request a strongly consistent read instead.\n-   /BatchGetItem/ - Performs multiple /GetItem/ requests for data items using their primary keys, from one table or multiple tables. The response from /BatchGetItem/ has a size limit of 16 MB and returns a maximum of 100 items. Both eventually consistent and strongly consistent reads can be used.\n-   /Query/ - Returns one or more items from a table or a secondary index. You must provide a specific value for the partition key. You can narrow the scope of the query using comparison operators against a sort key value, or on the index key. /Query/ supports either eventual or strong consistency. A single response has a size limit of 1 MB.\n-   /Scan/ - Reads every item in a table; the result set is eventually consistent. You can limit the number of items returned by filtering the data attributes, using conditional expressions. /Scan/ can be used to enable ad-hoc querying of a table against non-key attributes; however, since this is a full table scan without using an index, /Scan/ should not be used for any application query use case that requires predictable performance.\nFor conceptual information about reading data, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html Working with Items> and <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html Query and Scan Operations> in the /Amazon DynamoDB Developer Guide/.\n__Modifying Data__\n-   /PutItem/ - Creates a new item, or replaces an existing item with a new item (including all the attributes). By default, if an item in the table already exists with the same primary key, the new item completely replaces the existing item. You can use conditional operators to replace an item only if its attribute values match certain conditions, or to insert a new item only if that item doesn\\'t already exist.\n-   /UpdateItem/ - Modifies the attributes of an existing item. You can also use conditional operators to perform an update only if the item\\'s attribute values match certain conditions.\n-   /DeleteItem/ - Deletes an item in a table by primary key. You can use conditional operators to perform a delete an item only if the item\\'s attribute values match certain conditions.\n-   /BatchWriteItem/ - Performs multiple /PutItem/ and /DeleteItem/ requests across multiple tables in a single request. A failure of any request(s) in the batch will not cause the entire /BatchWriteItem/ operation to fail. Supports batches of up to 25 items to put or delete, with a maximum total request size of 16 MB.\nFor conceptual information about modifying data, see <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html Working with Items> and <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html Query and Scan Operations> in the /Amazon DynamoDB Developer Guide/.\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.DynamoDB\" or <https://aws.amazon.com/documentation/ the AWS Documentation>\nto get started.";
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
        "amazonka-dynamodb-test" = {
          depends = [
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."amazonka-test" or (buildDepError "amazonka-test"))
            (hsPkgs."amazonka-dynamodb" or (buildDepError "amazonka-dynamodb"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
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