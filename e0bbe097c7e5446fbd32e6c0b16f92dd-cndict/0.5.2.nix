{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "cndict";
          version = "0.5.2";
        };
        license = "LicenseRef-PublicDomain";
        copyright = "";
        maintainer = "Lemmih <lemmih@gmail.com>";
        author = "Lemmih <lemmih@gmail.com>";
        homepage = "https://github.com/Lemmih/cndict";
        url = "";
        synopsis = "Chinese/Mandarin <-> English dictionary, Chinese lexer.";
        description = "";
        buildType = "Simple";
      };
      components = {
        cndict = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.file-embed
            hsPkgs.containers
            hsPkgs.vector
            hsPkgs.bytestring
            hsPkgs.cassava
            hsPkgs.binary
          ];
        };
      };
    }