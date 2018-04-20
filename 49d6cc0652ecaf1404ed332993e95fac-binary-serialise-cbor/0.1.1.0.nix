{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.21";
        identifier = {
          name = "binary-serialise-cbor";
          version = "0.1.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "2015-2017 Duncan Coutts,\n2015-2017 Well-Typed LLP,\n2015 IRIS Connect Ltd";
        maintainer = "duncan@community.haskell.org, ben@smart-cactus.org";
        author = "Duncan Coutts";
        homepage = "";
        url = "";
        synopsis = "Yet Another Binary Serialisation Library (compatibility shim)";
        description = "This package is a shim around @cborg@, exposing an interface compatible with\nthe previous @binary-serialise-cbor@.";
        buildType = "Simple";
      };
      components = {
        binary-serialise-cbor = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.cborg
            hsPkgs.serialise
          ];
        };
      };
    }