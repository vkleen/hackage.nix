let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = { network-uri = true; plugins = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "gitit"; version = "0.12.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "http://gitit.net";
      url = "";
      synopsis = "Wiki using happstack, git or darcs, and pandoc.";
      description = "Gitit is a wiki backed by a git, darcs, or mercurial\nfilestore.  Pages and uploaded files can be modified either\ndirectly via the VCS's command-line tools or through\nthe wiki's web interface. Pandoc is used for markup\nprocessing, so pages may be written in\n(extended) markdown, reStructuredText, LaTeX, HTML,\nor literate Haskell, and exported in ten different\nformats, including LaTeX, ConTeXt, DocBook, RTF,\nOpenOffice ODT, and MediaWiki markup.\n\nNotable features include\n\n* plugins: dynamically loaded page\ntransformations written in Haskell (see\n\"Network.Gitit.Interface\")\n\n* conversion of TeX math to MathML for display in\nweb browsers\n\n* syntax highlighting of source code\nfiles and code snippets\n\n* Atom feeds (site-wide and per-page)\n\n* a library, \"Network.Gitit\", that makes it simple\nto include a gitit wiki in any happstack application\n\nYou can see a running demo at <http://gitit.net>.\n\nFor usage information:  @gitit --help@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."xhtml" or (buildDepError "xhtml"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."highlighting-kate" or (buildDepError "highlighting-kate"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."HStringTemplate" or (buildDepError "HStringTemplate"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."recaptcha" or (buildDepError "recaptcha"))
          (hsPkgs."filestore" or (buildDepError "filestore"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."url" or (buildDepError "url"))
          (hsPkgs."happstack-server" or (buildDepError "happstack-server"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."xml" or (buildDepError "xml"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."ConfigFile" or (buildDepError "ConfigFile"))
          (hsPkgs."feed" or (buildDepError "feed"))
          (hsPkgs."xss-sanitize" or (buildDepError "xss-sanitize"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."json" or (buildDepError "json"))
          (hsPkgs."uri" or (buildDepError "uri"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."hoauth2" or (buildDepError "hoauth2"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "6.10") [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."syb" or (buildDepError "syb"))
          ]) ++ (if flags.network-uri
          then [
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."network" or (buildDepError "network"))
            ]
          else [
            (hsPkgs."network" or (buildDepError "network"))
            ])) ++ (pkgs.lib).optionals (flags.plugins) [
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          ];
        buildable = true;
        };
      exes = {
        "gitit" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gitit" or (buildDepError "gitit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ] ++ (if flags.network-uri
            then [
              (hsPkgs."network-uri" or (buildDepError "network-uri"))
              (hsPkgs."network" or (buildDepError "network"))
              ]
            else [ (hsPkgs."network" or (buildDepError "network")) ]);
          buildable = true;
          };
        "expireGititCache" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."url" or (buildDepError "url"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            ] ++ (if flags.network-uri
            then [
              (hsPkgs."network-uri" or (buildDepError "network-uri"))
              (hsPkgs."network" or (buildDepError "network"))
              ]
            else [
              (hsPkgs."network" or (buildDepError "network"))
              ])) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "6.10") [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ];
          buildable = true;
          };
        };
      };
    }