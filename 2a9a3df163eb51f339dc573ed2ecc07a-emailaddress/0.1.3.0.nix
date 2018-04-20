{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "emailaddress";
          version = "0.1.3.0";
        };
        license = "BSD-3-Clause";
        copyright = "2016 Dennis Gosnell";
        maintainer = "cdep.illabout@gmail.com";
        author = "Dennis Gosnell";
        homepage = "https://github.com/cdepillabout/emailaddress#readme";
        url = "";
        synopsis = "Wrapper around email-validate library adding instances for common type classes.";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        emailaddress = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.bifunctors
            hsPkgs.bytestring
            hsPkgs.email-validate
            hsPkgs.opaleye
            hsPkgs.persistent
            hsPkgs.postgresql-simple
            hsPkgs.product-profunctors
            hsPkgs.profunctors
            hsPkgs.text
          ];
        };
        tests = {
          emailaddress-doctest = {
            depends  = [
              hsPkgs.base
              hsPkgs.doctest
              hsPkgs.Glob
            ];
          };
        };
      };
    }