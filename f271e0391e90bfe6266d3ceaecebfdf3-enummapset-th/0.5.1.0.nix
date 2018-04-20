{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "enummapset-th";
          version = "0.5.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "© 2012 Liyang HU";
        maintainer = "enummapset-th@liyang.hu";
        author = "Liyang HU";
        homepage = "https://github.com/liyang/enummapset-th";
        url = "";
        synopsis = "TH-generated EnumSet/EnumMap wrappers around IntSet/IntMap.";
        description = "This package wraps @IntSet@ and @IntMap@ from @containers@, and provides\nfast sets and maps keyed on any data type with a well-behaved @Enum@\ninstance. Useful for derived @Enum@s, newtype'd @Int@s, or any data type\nthat can be packed into an @Int@: just implement @fromEnum@ and @toEnum@.\n\nThe boilerplate is generated using Template Haskell, so unlike\n@enummapset@ it's easier to maintain and keep up-to-date with\n@containers@. On the downside, it's less portable.";
        buildType = "Simple";
      };
      components = {
        enummapset-th = {
          depends  = [
            hsPkgs.base
            hsPkgs.deepseq
            hsPkgs.containers
            hsPkgs.template-haskell
          ];
        };
      };
    }