{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "assert";
          version = "0.0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "© 2013 Liyang HU";
        maintainer = "assert@liyang.hu";
        author = "Liyang HU";
        homepage = "https://github.com/liyang/assert";
        url = "";
        synopsis = "Helpers for Control.Exception.assert";
        description = "GHC supports compile-time toggling of run-time assertions via the\n@-fignore-asserts@ flag, which only effects a behavioural change in\n'Control.Exception.assert'. Furthermore the reported location only gives\nthe use site of the aforementioned, making it difficult to abstract over\nand hence cumbersome to use.\n\nThis package aims to make assertions more convenient, and also provides\na rule to rewrite assertions to 'id' when @-fignore-asserts@ is used.";
        buildType = "Simple";
      };
      components = {
        "assert" = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          rewrite = {
            depends  = [
              hsPkgs."assert"
              hsPkgs.base
              hsPkgs.Cabal
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.system-posix-redirect
            ];
          };
        };
      };
    }