{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hakyll-shakespeare";
          version = "0.1.0.0.2";
        };
        license = "MIT";
        copyright = "2016 Eliza Calls.";
        maintainer = "Eliza <me@eliza.link>";
        author = "Eliza <me@eliza.link>";
        homepage = "";
        url = "";
        synopsis = "Hakyll Hamlet compiler";
        description = "hakyll-shakespeare is for using Hamlet with Hakyll.\nThis library used Text.Hamlet.Runtime.";
        buildType = "Simple";
      };
      components = {
        hakyll-shakespeare = {
          depends  = [
            hsPkgs.base
            hsPkgs.hakyll
            hsPkgs.containers
            hsPkgs.blaze-html
            hsPkgs.shakespeare
            hsPkgs.text
          ];
        };
      };
    }