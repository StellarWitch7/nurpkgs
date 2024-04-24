{ pkgs, lib, fetchFromGitHub, buildDotnetModule }:

buildDotnetModule rec {
  pname = "moth-lang";
  version = "0.1-dev";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-yYOdJQ1XVGyo0vuFpzKYm1FN74wKoqD/4FCz8//fYoo=";
  };

  projectFile = "Moth.Luna/Moth.Luna.csproj";

  nugetDeps = ./deps.nix;
  dotnet-sdk = pkgs.dotnetCorePackages.sdk_7_0;
  dotnet-runtime = pkgs.dotnetCorePackages.runtime_7_0;

  runtimeDeps = with pkgs; [
    clang_16
    git
    git-extras
  ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/moth-lang";
    description = "C# implementation of the Moth compiler and tools";
    license = licenses.bsd3;
  };
}
