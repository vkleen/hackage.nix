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
          name = "http-client-request-modifiers";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2014 Sean Leather";
        maintainer = "sean.leather@gmail.com";
        author = "Sean Leather";
        homepage = "https://github.com/spl/http-client-request-modifiers";
        url = "";
        synopsis = "Convenient monadic HTTP request modifiers";
        description = "These are simple, monadic functions that modify an HTTP @Request@ from\n@http-client@. They make it easy to chain request updates and allow for\narbitrary monadic effects.";
        buildType = "Simple";
      };
      components = {
        http-client-request-modifiers = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.exceptions
            hsPkgs.http-client
            hsPkgs.http-media
            hsPkgs.http-types
          ] ++ (if _flags.network-uri
            then [
              hsPkgs.network
              hsPkgs.network-uri
            ]
            else [ hsPkgs.network ]);
        };
      };
    }