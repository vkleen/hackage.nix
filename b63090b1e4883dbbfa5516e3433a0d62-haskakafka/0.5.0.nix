{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "haskakafka";
          version = "0.5.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Thomas Dimson <tdimson@cs.stanford.edu>";
        author = "Thomas Dimson <tdimson@cs.stanford.edu>";
        homepage = "http://github.com/cosbynator/haskakafka";
        url = "";
        synopsis = "Kafka bindings for Haskell";
        description = "Use Apache Kafka in Haskell through the librdkafka\nC library.";
        buildType = "Simple";
      };
      components = {
        haskakafka = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.temporary
            hsPkgs.unix
          ];
          libs = [ pkgs.rdkafka ];
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.haskakafka
              hsPkgs.hspec
              hsPkgs.regex-posix
              hsPkgs.either-unwrap
            ];
          };
        };
      };
    }