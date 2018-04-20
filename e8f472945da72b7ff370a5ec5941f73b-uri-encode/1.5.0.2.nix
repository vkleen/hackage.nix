{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      tools = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "uri-encode";
          version = "1.5.0.2";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "code@silk.co";
        author = "Silk";
        homepage = "";
        url = "";
        synopsis = "Unicode aware uri-encoding.";
        description = "Unicode aware uri-encoding.";
        buildType = "Simple";
      };
      components = {
        uri-encode = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.network
            hsPkgs.text
            hsPkgs.utf8-string
          ];
        };
        exes = {
          uri-encode = {
            depends  = pkgs.lib.optionals _flags.tools [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.network
              hsPkgs.text
              hsPkgs.utf8-string
            ];
          };
          uri-decode = {
            depends  = pkgs.lib.optionals _flags.tools [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.network
              hsPkgs.text
              hsPkgs.utf8-string
            ];
          };
        };
      };
    }