{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      buildtests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "data-object-yaml";
          version = "0.3.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Snoyman <michael@snoyman.com>";
        author = "Michael Snoyman <michael@snoyman.com>, Anton Ageev <antage@gmail.com>";
        homepage = "http://github.com/snoyberg/data-object-yaml";
        url = "";
        synopsis = "Serialize data to and from Yaml files";
        description = "Provides high level conversions based on the data-object package. Parsing and emitting is handled by the yaml package, which in turn uses the libyaml C library.";
        buildType = "Simple";
      };
      components = {
        data-object-yaml = {
          depends  = [
            hsPkgs.base
            hsPkgs.data-object
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.failure
            hsPkgs.transformers
            hsPkgs.yaml
            hsPkgs.containers
            hsPkgs.enumerator
            hsPkgs.MonadCatchIO-transformers
            hsPkgs.convertible-text
          ];
        };
        exes = {
          runtests = {
            depends  = pkgs.lib.optionals _flags.buildtests [
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.HUnit
            ];
          };
        };
      };
    }