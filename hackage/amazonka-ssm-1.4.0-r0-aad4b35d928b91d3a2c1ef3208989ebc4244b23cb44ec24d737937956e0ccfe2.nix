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
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "amazonka-ssm"; version = "1.4.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013-2016 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "https://github.com/brendanhay/amazonka";
      url = "";
      synopsis = "Amazon Simple Systems Management Service SDK.";
      description = "Simple Systems Manager (SSM) enables you to remotely manage the\nconfiguration of your Amazon EC2 instance. Using SSM, you can run\nscripts or commands using either EC2 Run Command or SSM Config. (SSM\nConfig is currently available only for Windows instances.)\n__Run Command__\nRun Command provides an on-demand experience for executing commands. You\ncan use pre-defined Amazon SSM documents to perform the actions listed\nlater in this section, or you can create your own documents. With these\ndocuments, you can remotely configure your instances by sending commands\nusing the __Commands__ page in the\n<http://console.aws.amazon.com/ec2/ Amazon EC2 console>,\n<http://docs.aws.amazon.com/powershell/latest/reference/items/Amazon_Simple_Systems_Management_cmdlets.html AWS Tools for Windows PowerShell>,\nor the\n<http://docs.aws.amazon.com/cli/latest/reference/ssm/index.html AWS CLI>.\nRun Command reports the status of the command execution for each\ninstance targeted by a command. You can also audit the command execution\nto understand who executed commands, when, and what changes were made.\nBy switching between different SSM documents, you can quickly configure\nyour instances with different types of commands. To get started with Run\nCommand, verify that your environment meets the prerequisites for\nremotely running commands on EC2 instances\n(<http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/remote-commands-prereq.html Linux>\nor\n<http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/remote-commands-prereq.html Windows>).\n__SSM Config__\nSSM Config is a lightweight instance configuration solution. SSM Config\nis currently only available for Windows instances. With SSM Config, you\ncan specify a setup configuration for your instances. SSM Config is\nsimilar to EC2 User Data, which is another way of running one-time\nscripts or applying settings during instance launch. SSM Config is an\nextension of this capability. Using SSM documents, you can specify which\nactions the system should perform on your instances, including which\napplications to install, which AWS Directory Service directory to join,\nwhich Microsoft PowerShell modules to install, etc. If an instance is\nmissing one or more of these configurations, the system makes those\nchanges. By default, the system checks every five minutes to see if\nthere is a new configuration to apply as defined in a new SSM document.\nIf so, the system updates the instances accordingly. In this way, you\ncan remotely maintain a consistent configuration baseline on your\ninstances. SSM Config is available using the AWS CLI or the AWS Tools\nfor Windows PowerShell. For more information, see\n<http://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-configuration-manage.html Managing Windows Instance Configuration>.\nSSM Config and Run Command include the following pre-defined documents.\nAmazon Pre-defined SSM Documents\nName Description Platform\nAWS-RunShellScript\nRun shell scripts\nLinux\nAWS-UpdateSSMAgent\nUpdate the Amazon SSM agent\nLinux\nAWS-JoinDirectoryServiceDomain\nJoin an AWS Directory\nWindows\nAWS-RunPowerShellScript\nRun PowerShell commands or scripts\nWindows\nAWS-UpdateEC2Config\nUpdate the EC2Config service\nWindows\nAWS-ConfigureWindowsUpdate\nConfigure Windows Update settings\nWindows\nAWS-InstallApplication\nInstall, repair, or uninstall software using an MSI package\nWindows\nAWS-InstallPowerShellModule\nInstall PowerShell modules\nWindows\nAWS-ConfigureCloudWatch\nConfigure Amazon CloudWatch Logs to monitor applications and systems\nWindows\nThe commands or scripts specified in SSM documents run with\nadministrative privilege on your instances because the Amazon SSM agent\nruns as root on Linux and the EC2Config service runs in the Local System\naccount on Windows. If a user has permission to execute any of the\npre-defined SSM documents (any document that begins with AWS-*) then\nthat user also has administrator access to the instance. Delegate access\nto SSM and Run Command judiciously. This becomes extremely important if\nyou create your own SSM documents. Amazon Web Services does not provide\nguidance about how to create secure SSM documents. You create SSM\ndocuments and delegate access to Run Command at your own risk. As a\nsecurity best practice, we recommend that you assign access to \\\"AWS-*\\\"\ndocuments, especially the AWS-RunShellScript document on Linux and the\nAWS-RunPowerShellScript document on Windows, to trusted administrators\nonly. You can create SSM documents for specific tasks and delegate\naccess to non-administrators.\n\nThe types from this library are intended to be used with\n<http://hackage.haskell.org/package/amazonka amazonka>, which provides\nmechanisms for specifying AuthN/AuthZ information and sending requests.\n\nUse of lenses is required for constructing and manipulating types.\nThis is due to the amount of nesting of AWS types and transparency regarding\nde/serialisation into more palatable Haskell values.\nThe provided lenses should be compatible with any of the major lens libraries\nsuch as <http://hackage.haskell.org/package/lens lens> or\n<http://hackage.haskell.org/package/lens-family-core lens-family-core>.\n\nSee \"Network.AWS.SSM\" or <https://aws.amazon.com/documentation/ the AWS Documentation>\nto get started.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      tests = {
        "amazonka-ssm-test" = {
          depends = [
            (hsPkgs."amazonka-core" or (buildDepError "amazonka-core"))
            (hsPkgs."amazonka-test" or (buildDepError "amazonka-test"))
            (hsPkgs."amazonka-ssm" or (buildDepError "amazonka-ssm"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }