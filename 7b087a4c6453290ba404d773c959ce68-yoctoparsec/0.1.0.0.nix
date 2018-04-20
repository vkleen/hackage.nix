{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "yoctoparsec";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "(C) 2016 mniip";
        maintainer = "mniip@mniip.com";
        author = "mniip";
        homepage = "https://github.com/mniip/yoctoparsec";
        url = "";
        synopsis = "A truly tiny monadic parsing library";
        description = "A monadic parsing library making use of the free monad\ntransformer. All instances are provided by the FreeT monad.";
        buildType = "Simple";
      };
      components = {
        yoctoparsec = {
          depends  = [
            hsPkgs.base
            hsPkgs.free
            hsPkgs.mtl
          ];
        };
      };
    }