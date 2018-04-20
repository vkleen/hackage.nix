{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "amazonka-redshift";
          version = "0.0.1";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "Copyright (c) 2013-2014 Brendan Hay";
        maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
        author = "Brendan Hay";
        homepage = "https://github.com/brendanhay/amazonka";
        url = "";
        synopsis = "Amazon Redshift SDK.";
        description = "Amazon Redshift is a fast, fully managed, petabyte-scale data warehouse\nservice that makes it simple and cost-effective to efficiently analyze\nall your data using your existing business intelligence tools. You can\nstart small for just \$0.25 per hour with no commitments or upfront\ncosts and scale to a petabyte or more for \$1,000 per terabyte per year,\nless than a tenth of most other data warehousing solutions.\n\n/See:/ <http://docs.aws.amazon.com/redshift/latest/APIReference/Welcome.html AWS API Reference>\n\n/Warning:/ This is an experimental preview release which is still under\nheavy development and not intended for public consumption, caveat emptor!";
        buildType = "Simple";
      };
      components = {
        amazonka-redshift = {
          depends  = [
            hsPkgs.amazonka-core
            hsPkgs.base
          ];
        };
      };
    }