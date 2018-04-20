{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "language-thrift";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Abhinav Gupta <mail@abhinavg.net>";
        author = "Abhinav Gupta";
        homepage = "https://github.com/abhinav/language-thrift";
        url = "";
        synopsis = "Parser for the Thrift IDL format.";
        description = "This package provides a parser for the\n<http://thrift.apache.org/docs/idl Thrift IDL format>.";
        buildType = "Simple";
      };
      components = {
        language-thrift = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.parsers
            hsPkgs.trifecta
          ];
        };
      };
    }