{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "tibetan-utils";
          version = "0.1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2016 Vanessa McHale";
        maintainer = "tmchale@wisc.edu";
        author = "Vanessa McHale";
        homepage = "https://github.com/vmchale/tibetan-utils#readme";
        url = "";
        synopsis = "Parse and display tibetan numerals";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        tibetan-utils = {
          depends  = [
            hsPkgs.base
            hsPkgs.megaparsec
            hsPkgs.text
            hsPkgs.composition
            hsPkgs.text-show
            hsPkgs.either
          ];
        };
        tests = {
          tibetan-utils-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.tibetan-utils
              hsPkgs.hspec
              hsPkgs.hspec-megaparsec
              hsPkgs.text
              hsPkgs.megaparsec
            ];
          };
        };
      };
    }