{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "box-tuples";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "mniip@mniip.com";
        author = "mniip";
        homepage = "";
        url = "";
        synopsis = "A hack to use GHC.Prim primitives in GHCi";
        description = "As of now, the GHCi interactive runtime is incapable of working on unboxed\ntuples. In particular, it is unable to fully apply any function returning an\nunboxed tuple, create a function that takes a non-nullary unboxed tuple as\nargument, or pass a non-nullary tuple to some other function. The usual\nsolution is to enable object code generation with @-fobject-code@. This\npackage serves as a workaround for the cases where @-fobject-code@ is\nundesiable.";
        buildType = "Simple";
      };
      components = {
        box-tuples = {
          depends  = [
            hsPkgs.base
            hsPkgs.ghc-prim
          ];
        };
      };
    }