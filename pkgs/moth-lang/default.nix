{ pkgs, lib, fetchFromGitHub, buildDotnetModule }:

buildDotnetModule rec {
  pname = "moth-lang";
  version = "0.1-indev";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-LQ5FBr6mNBZiF7nXCD5QILL90ahd2N2FzAfVmNaaPdY=";
  };

  projectFile = "Moth.CLI/Moth.CLI.csproj";

  nugetDeps = ./deps.nix;
  dotnet-sdk = pkgs.dotnetCorePackages.sdk_7_0;
  dotnet-runtime = pkgs.dotnetCorePackages.runtime_7_0;

  runtimeDeps = [ pkgs.clang_16 ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/moth-lang";
    description = "C# implementation of the Moth compiler and tools";
    license = licenses.bsd3;
  };
}
