{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "libpq";
          version = "0.4.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "grant@tnarg.com";
        author = "Grant Monroe";
        homepage = "http://github.com/tnarg/haskell-libpq";
        url = "";
        synopsis = "libpq binding for Haskell";
        description = "This is a binding to libpq: the C application\nprogrammer's interface to PostgreSQL. libpq is a\nset of library functions that allow client\nprograms to pass queries to the PostgreSQL\nbackend server and to receive the results of\nthese queries.";
        buildType = "Custom";
      };
      components = {
        libpq = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.unix
          ];
          libs = [ pkgs.pq ];
        };
      };
    }