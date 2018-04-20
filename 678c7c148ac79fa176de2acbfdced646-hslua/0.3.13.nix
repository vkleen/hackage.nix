{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      system-lua = false;
      apicheck = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hslua";
          version = "0.3.13";
        };
        license = "MIT";
        copyright = "2007-2012, Gracjan Polak";
        maintainer = "omeragacan@gmail.com";
        author = "Gracjan Polak, Ömer Sinan Ağacan";
        homepage = "";
        url = "";
        synopsis = "A Lua language interpreter embedding in Haskell";
        description = "The Scripting.Lua module is a wrapper of Lua language interpreter\nas described in www.lua.org.\n\nThis package contains full Lua interpreter version 5.1.4.\nIf you want to link it with system-wide Lua installation, use system-lua flag.";
        buildType = "Simple";
      };
      components = {
        hslua = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
          ];
          pkgconfig = pkgs.lib.optional _flags.system-lua pkgconfPkgs.lua;
        };
        tests = {
          simple-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.hslua
            ];
          };
        };
      };
    }