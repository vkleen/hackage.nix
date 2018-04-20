{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      newbase = true;
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2.3";
        identifier = {
          name = "regex-pcre";
          version = "0.94.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2006, Christopher Kuklewicz";
        maintainer = "TextRegexLazy@personal.mightyreason.com";
        author = "Christopher Kuklewicz";
        homepage = "http://sourceforge.net/projects/lazy-regex";
        url = "http://darcs.haskell.org/packages/regex-unstable/regex-pcre/";
        synopsis = "Replaces/Enhances Text.Regex";
        description = "The PCRE backend to accompany regex-base, see www.pcre.org";
        buildType = "Simple";
      };
      components = {
        regex-pcre = {
          depends  = if _flags.newbase
            then [
              hsPkgs.base
              hsPkgs.regex-base
              hsPkgs.array
              hsPkgs.containers
              hsPkgs.bytestring
            ]
            else if _flags.splitbase
              then [
                hsPkgs.base
                hsPkgs.regex-base
                hsPkgs.array
                hsPkgs.containers
                hsPkgs.bytestring
              ]
              else [
                hsPkgs.base
                hsPkgs.regex-base
              ];
          libs = [ pkgs.pcre ];
        };
      };
    }