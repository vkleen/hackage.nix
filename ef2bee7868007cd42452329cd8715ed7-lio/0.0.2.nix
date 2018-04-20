{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "lio";
          version = "0.0.2";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "Deian Stefan  <deian at cs dot stanford dot edu>";
        author = "HAILS team";
        homepage = "";
        url = "";
        synopsis = "Labeled IO Information Flow Control Library";
        description = "The /Labeled IO/ (LIO) library provides information flow\ncontrol for incorporating untrusted code within Haskell\napplications.  Most code should import module \"LIO.LIO\" and\nwhichever label type the application is using (e.g.,\n\"LIO.DCLabel\").  The core functionality of the library is\ndocumented in \"LIO.TCB\".  LIO was implemented by David\nMazieres (<http://www.scs.stanford.edu/~dm/>), Deian Stefan\n(<http://www.scs.stanford.edu/~deian/>), Alejandro Russo\n(<http://www.cse.chalmers.se/~russo/>) and John C. Mitchell\n(<http://www.stanford.edu/~jcm/>).\nThe extended version of our paper, that includes the proofs\nis available here:\n<http://www.scs.stanford.edu/~deian/pubs/stefan:2011:flexible-ext.pdf>.\nThe library depends on the @DCLabel@ module. You can read more on\nDC Labels here:\n<http://www.scs.stanford.edu/~deian/dclabels/>.";
        buildType = "Simple";
      };
      components = {
        lio = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.mtl
            hsPkgs.old-time
            hsPkgs.unix
            hsPkgs.SHA
            hsPkgs.time
            hsPkgs.dclabel
          ];
        };
      };
    }