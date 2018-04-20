{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.22";
        identifier = {
          name = "wolf";
          version = "0.3.44";
        };
        license = "MIT";
        copyright = "Copyright (C) 2015-2016 Swift Navigation, Inc.";
        maintainer = "Mark Fine <dev@swiftnav.com>";
        author = "Swift Navigation Inc.";
        homepage = "https://github.com/swift-nav/wolf";
        url = "";
        synopsis = "Amazon Simple Workflow Service Wrapper.";
        description = "Wolf is a wrapper around Amazon Simple Workflow Service.";
        buildType = "Simple";
      };
      components = {
        wolf = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.amazonka
            hsPkgs.amazonka-swf
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.conduit
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.http-types
            hsPkgs.lifted-async
            hsPkgs.lifted-base
            hsPkgs.preamble
            hsPkgs.process
            hsPkgs.time
            hsPkgs.uuid
            hsPkgs.yaml
          ];
        };
        exes = {
          wolf-actor = {
            depends  = [
              hsPkgs.base
              hsPkgs.wolf
              hsPkgs.optparse-generic
            ];
          };
          wolf-decider = {
            depends  = [
              hsPkgs.base
              hsPkgs.wolf
              hsPkgs.optparse-generic
            ];
          };
          wolf-counter = {
            depends  = [
              hsPkgs.base
              hsPkgs.wolf
              hsPkgs.optparse-generic
            ];
          };
        };
      };
    }