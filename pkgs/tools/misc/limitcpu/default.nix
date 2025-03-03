{lib, stdenv, fetchurl}:

stdenv.mkDerivation rec {
  pname = "limitcpu";
  version = "2.9";

  src = fetchurl {
    url = "mirror://sourceforge/limitcpu/cpulimit-${version}.tar.gz";
    sha256 = "sha256-W7fbTscqArOy0SfViQaGTgE1iw81pvGQuAlwN4ovjPY=";
  };

  buildFlags = with stdenv; [ (
    if isDarwin then "osx"
    else if isFreeBSD then "freebsd"
    else "cpulimit"
  ) ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    homepage = "https://limitcpu.sourceforge.net/";
    description = "A tool to throttle the CPU usage of programs";
    platforms = with platforms; linux ++ freebsd;
    license = licenses.gpl2;
    maintainers = [maintainers.rycee];
  };
}
