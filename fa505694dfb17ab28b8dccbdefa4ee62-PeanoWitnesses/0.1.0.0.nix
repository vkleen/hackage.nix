{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "PeanoWitnesses";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "kenny.foner@gmail.com";
        author = "Kenneth Foner";
        homepage = "";
        url = "";
        synopsis = "GADT type witnesses for Peano-style natural numbers.";
        description = "Witnesses for Peano naturals are unary natural numbers paired with a natural number type index. These terms act as witnesses of a particular natural; we can recover the type information by examining the terms.";
        buildType = "Simple";
      };
      components = {
        PeanoWitnesses = {
          depends  = [ hsPkgs.base ];
        };
      };
    }