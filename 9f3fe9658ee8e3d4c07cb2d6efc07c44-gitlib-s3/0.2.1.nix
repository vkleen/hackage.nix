{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "gitlib-s3";
          version = "0.2.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "johnw@fpcomplete.com";
        author = "John Wiegley";
        homepage = "";
        url = "";
        synopsis = "A repository backend for storing Git objects in Amazon S3";
        description = "A repository backend for storing Git objects in Amazon S3.";
        buildType = "Simple";
      };
      components = {
        gitlib-s3 = {
          depends  = [
            hsPkgs.base
            hsPkgs.gitlib
            hsPkgs.hlibgit2
            hsPkgs.HUnit
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.lens
            hsPkgs.attempt
            hsPkgs.parallel-io
            hsPkgs.stringable
            hsPkgs.system-fileio
            hsPkgs.system-filepath
            hsPkgs.text
            hsPkgs.time
            hsPkgs.aws
            hsPkgs.conduit
            hsPkgs.http-conduit
            hsPkgs.binary
            hsPkgs.yaml
          ];
        };
        tests = {
          smoke = {
            depends  = [
              hsPkgs.base
              hsPkgs.gitlib-s3
              hsPkgs.gitlib
              hsPkgs.hlibgit2
              hsPkgs.aws
              hsPkgs.HUnit
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.lens
              hsPkgs.http-conduit
              hsPkgs.parallel-io
              hsPkgs.stringable
              hsPkgs.system-fileio
              hsPkgs.system-filepath
              hsPkgs.text
              hsPkgs.time
            ];
          };
        };
      };
    }