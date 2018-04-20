{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      examples = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "libltdl";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2011 Harvard University";
        maintainer = "mainland@eecs.harvard.edu";
        author = "Geoffrey Mainland <mainland@eecs.harvard.edu>";
        homepage = "http://www.eecs.harvard.edu/~mainland/projects/libffi";
        url = "";
        synopsis = "FFI interface to libltdl";
        description = "";
        buildType = "Custom";
      };
      components = {
        libltdl = {
          depends  = [ hsPkgs.base ];
        };
        exes = {
          sin = {
            depends  = [
              hsPkgs.base
              hsPkgs.libltdl
            ];
          };
        };
      };
    }