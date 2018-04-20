{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      buildtests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hamlet";
          version = "0.5.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Snoyman <michael@snoyman.com>";
        author = "Michael Snoyman <michael@snoyman.com>";
        homepage = "http://docs.yesodweb.com/";
        url = "";
        synopsis = "Haml-like template files that are compile-time checked";
        description = "Hamlet gives you a type-safe tool for generating HTML code. It works via Quasi-Quoting, and generating extremely efficient output code. The syntax is white-space sensitive, and it helps you avoid cross-site scripting issues and 404 errors. Please see the documentation at <http://docs.yesodweb.com/hamlet/> for more details.\n\nAs a quick overview, here is a sample Hamlet template:\n\n> !!!\n> %html\n>     %head\n>         %title Hamlet Demo\n>     %body\n>         %h1 Information on \$name.person\$\n>         %p \$*name.person\$ is \$age.person\$ years old.\n>         %h2\n>             \$if isMarried.person\n>                 Married\n>             \$else\n>                 Not married\n>         %ul\n>             \$forall children.person child\n>                 %li \$child\$\n>         %p\n>             %a!href=@page.person@ See the page.\n>         ^footer^";
        buildType = "Simple";
      };
      components = {
        hamlet = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.template-haskell
            hsPkgs.blaze-builder
            hsPkgs.parsec
            hsPkgs.failure
            hsPkgs.text
          ];
        };
        exes = {
          runtests = {
            depends  = pkgs.lib.optionals _flags.buildtests [
              hsPkgs.QuickCheck
              hsPkgs.HUnit
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework
            ];
          };
        };
      };
    }