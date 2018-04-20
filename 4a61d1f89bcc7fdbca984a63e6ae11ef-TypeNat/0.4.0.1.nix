{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "TypeNat";
          version = "0.4.0.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "aovieth@gmail.com";
        author = "Alexander Vieth";
        homepage = "https://github.com/avieth/TypeNat";
        url = "";
        synopsis = "Some Nat-indexed types for GHC";
        description = "";
        buildType = "Simple";
      };
      components = {
        TypeNat = {
          depends  = [ hsPkgs.base ];
        };
      };
    }