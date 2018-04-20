{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "murmur";
          version = "0.0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "2016 Author name here";
        maintainer = "example@example.com";
        author = "Author name here";
        homepage = "http://github.com/tokiwoousaka/murmur#readme";
        url = "";
        synopsis = "Initial project template from stack";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        murmur = {
          depends  = [
            hsPkgs.base
            hsPkgs.twitter-conduit
            hsPkgs.twitter-types-lens
            hsPkgs.text
            hsPkgs.bytestring
            hsPkgs.authenticate-oauth
            hsPkgs.http-conduit
            hsPkgs.resourcet
            hsPkgs.conduit
            hsPkgs.conduit-extra
            hsPkgs.transformers
            hsPkgs.data-default
            hsPkgs.lens
          ];
        };
        exes = {
          mur = {
            depends  = [
              hsPkgs.base
              hsPkgs.murmur
              hsPkgs.twitter-conduit
              hsPkgs.optparse-declarative
              hsPkgs.transformers
              hsPkgs.directory
            ];
          };
        };
        tests = {
          murmur-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.murmur
            ];
          };
        };
      };
    }