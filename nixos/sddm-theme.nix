{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "9048065f6d93abbfb57102a0d8ca278f15e877d3";
    sha256 = "1g9lb9q2rfckisbsxmv2jgfx92vfm32cirbq5z9xhmkvflyjy3bv";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
