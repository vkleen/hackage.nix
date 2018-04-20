{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "interpolatedstring-perl6";
          version = "1.0.0";
        };
        license = "LicenseRef-PublicDomain";
        copyright = "Audrey Tang";
        maintainer = "Audrey Tang <audreyt@audreyt.org>";
        author = "Audrey Tang";
        homepage = "";
        url = "";
        synopsis = "QuasiQuoter for Perl6-style multi-line interpolated strings";
        description = "QuasiQuoter for Perl6-style multi-line interpolated strings with \\\"q\\\", \\\"qq\\\" and \\\"qc\\\" support.";
        buildType = "Custom";
      };
      components = {
        interpolatedstring-perl6 = {
          depends  = [
            hsPkgs.base
            hsPkgs.template-haskell
            hsPkgs.haskell-src-meta
            hsPkgs.text
            hsPkgs.bytestring
          ];
        };
      };
    }