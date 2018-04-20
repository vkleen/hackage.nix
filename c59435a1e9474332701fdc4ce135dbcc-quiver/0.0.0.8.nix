{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "quiver";
          version = "0.0.0.8";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2015 Patryk Zadarnowski";
        maintainer = "Patryk Zadarnowski <pat@jantar.org>";
        author = "Patryk Zadarnowski";
        homepage = "https://github.com/zadarnowski/quiver";
        url = "";
        synopsis = "Quiver finite stream processing library";
        description = "/Quiver/ is a powerful stream processing library for\ncombinatorial and monadic representation of computations\nover both inductive and coinductive data streams.\nIt is similar to Gabriel Gonzalez's /pipes/ and\nMichael Snoyman's /conduit/, but generalises both\nwith support for functor-based computations and\na clean support for finite (i.e., inductive) data\nstreams, both upstream and downstream of the computation\nbeing defined.";
        buildType = "Simple";
      };
      components = {
        quiver = {
          depends  = [ hsPkgs.base ];
        };
      };
    }