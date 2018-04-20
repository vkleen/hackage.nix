{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "extrapolate";
          version = "0.2.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Rudy Matela <rudy@matela.com.br>";
        author = "Rudy Matela";
        homepage = "https://github.com/rudymatela/extrapolate#readme";
        url = "";
        synopsis = "generalize counter-examples of test properties";
        description = "Extrapolate is a tool able to provide generalized counter-examples of test\nproperties where irrelevant sub-expressions are replaces with variables.\n\nFor the incorrect property @\\\\xs -> nub xs == (xs::[Int])@:\n\n* @[0,0]@ is a counter-example;\n\n* @x:x:_@ is a generalized counter-example.";
        buildType = "Simple";
      };
      components = {
        extrapolate = {
          depends  = [
            hsPkgs.base
            hsPkgs.leancheck
            hsPkgs.template-haskell
            hsPkgs.speculate
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.leancheck
              hsPkgs.speculate
              hsPkgs.extrapolate
            ];
          };
          derive = {
            depends  = [
              hsPkgs.base
              hsPkgs.leancheck
              hsPkgs.speculate
              hsPkgs.extrapolate
            ];
          };
          utils = {
            depends  = [
              hsPkgs.base
              hsPkgs.leancheck
              hsPkgs.speculate
              hsPkgs.extrapolate
            ];
          };
          new = {
            depends  = [
              hsPkgs.base
              hsPkgs.leancheck
              hsPkgs.speculate
              hsPkgs.extrapolate
            ];
          };
        };
      };
    }