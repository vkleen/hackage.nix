{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "regex-compat";
          version = "0.90";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2006, Christopher Kuklewicz";
        maintainer = "TextRegexLazy@personal.mightyreason.com";
        author = "Christopher Kuklewicz";
        homepage = "http://sourceforge.net/projects/lazy-regex";
        url = "http://darcs.haskell.org/packages/regex-unstable/regex-compat/";
        synopsis = "Replaces/Enhances Text.Regex";
        description = "One module layer over regex-posix to replace Text.Regex";
        buildType = "Custom";
      };
      components = {
        regex-compat = {
          depends  = [
            hsPkgs.regex-base
            hsPkgs.regex-posix
            hsPkgs.base
          ];
        };
      };
    }