{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "bff-mono";
          version = "0.2.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "kztk@is.s.u-tokyo.ac.jp";
        author = "Kazutaka Matsuda,\nMeng Wang";
        homepage = "https://bitbucket.org/kztk/bff-mono/";
        url = "";
        synopsis = "\"Bidirectionalization for Free\" for Monomorphic Transformations";
        description = "This package provides a way to make a bidirectional\ntransformation (a getter/setter pair, or so-called lens)\nfrom a description of unidirectional transformation.\nLike 'bff' package, the package constructs bidirectional\ntransformations based on the free theorem.\nUnlike 'bff' package,\nthe package supports some of monomorphic transformations.";
        buildType = "Simple";
      };
      components = {
        bff-mono = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.containers
          ];
        };
      };
    }