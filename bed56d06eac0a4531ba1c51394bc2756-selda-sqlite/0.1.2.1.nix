{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      haste = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "selda-sqlite";
          version = "0.1.2.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "anton@ekblad.cc";
        author = "Anton Ekblad";
        homepage = "https://github.com/valderman/selda";
        url = "";
        synopsis = "SQLite backend for the Selda database EDSL.";
        description = "SQLite backend for the Selda database EDSL.";
        buildType = "Simple";
      };
      components = {
        selda-sqlite = {
          depends  = [
            hsPkgs.base
            hsPkgs.exceptions
            hsPkgs.selda
            hsPkgs.text
          ] ++ pkgs.lib.optional (!_flags.haste) hsPkgs.direct-sqlite;
        };
      };
    }