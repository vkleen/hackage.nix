{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      network-uri = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "http-client";
          version = "0.5.10";
        };
        license = "MIT";
        copyright = "";
        maintainer = "michael@snoyman.com";
        author = "Michael Snoyman";
        homepage = "https://github.com/snoyberg/http-client";
        url = "";
        synopsis = "An HTTP client engine";
        description = "Hackage documentation generation is not reliable. For up to date documentation, please see: <http://www.stackage.org/package/http-client>.";
        buildType = "Simple";
      };
      components = {
        http-client = {
          depends  = (([
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.http-types
            hsPkgs.blaze-builder
            hsPkgs.time
            hsPkgs.network
            hsPkgs.streaming-commons
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.deepseq
            hsPkgs.case-insensitive
            hsPkgs.base64-bytestring
            hsPkgs.cookie
            hsPkgs.exceptions
            hsPkgs.array
            hsPkgs.random
            hsPkgs.filepath
            hsPkgs.mime-types
            hsPkgs.ghc-prim
            hsPkgs.stm
          ] ++ (if _flags.network-uri
            then [
              hsPkgs.network
              hsPkgs.network-uri
            ]
            else [
              hsPkgs.network
            ])) ++ pkgs.lib.optional (!compiler.isGhc) hsPkgs.semigroups) ++ pkgs.lib.optionals system.isWindows [
            hsPkgs.Win32
            hsPkgs.safe
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.http-client
              hsPkgs.hspec
              hsPkgs.monad-control
              hsPkgs.bytestring
              hsPkgs.text
              hsPkgs.http-types
              hsPkgs.blaze-builder
              hsPkgs.time
              hsPkgs.network
              hsPkgs.containers
              hsPkgs.transformers
              hsPkgs.deepseq
              hsPkgs.case-insensitive
              hsPkgs.base64-bytestring
              hsPkgs.zlib
              hsPkgs.async
              hsPkgs.streaming-commons
            ];
          };
          spec-nonet = {
            depends  = [
              hsPkgs.base
              hsPkgs.http-client
              hsPkgs.hspec
              hsPkgs.monad-control
              hsPkgs.bytestring
              hsPkgs.text
              hsPkgs.http-types
              hsPkgs.blaze-builder
              hsPkgs.time
              hsPkgs.network
              hsPkgs.network-uri
              hsPkgs.containers
              hsPkgs.transformers
              hsPkgs.deepseq
              hsPkgs.case-insensitive
              hsPkgs.base64-bytestring
              hsPkgs.zlib
              hsPkgs.async
              hsPkgs.streaming-commons
              hsPkgs.directory
            ];
          };
        };
      };
    }