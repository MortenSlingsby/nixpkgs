{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "opentelemetry-collector";
  version = "0.77.0";

  src = fetchFromGitHub {
    owner = "open-telemetry";
    repo = "opentelemetry-collector";
    rev = "v${version}";
    hash = "sha256-koPkEOtB5KnePdx67hJ/WNBojNDqKvf9kqYb59bwh8k=";
  };
  # there is a nested go.mod
  sourceRoot = "source/cmd/otelcorecol";
  vendorHash = "sha256-M1fLrQFrcfCRCcunkgEzUicVfi5Mz/Or6tFpcGfWf4E=";

  patches = [
    # remove when fixed upstream
    # https://github.com/open-telemetry/opentelemetry-collector/issues/7668
    ./update_go-m1cpu_fix_aarch64-darwin.patch
  ];

  preBuild = ''
    # set the build version, can't be done via ldflags
    sed -i -E 's/Version:(\s*)".*"/Version:\1"${version}"/' main.go
  '';

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    homepage = "https://github.com/open-telemetry/opentelemetry-collector";
    changelog = "https://github.com/open-telemetry/opentelemetry-collector/blob/v${version}/CHANGELOG.md";
    description = "A vendor-agnostic implementation on how to receive, process and export telemetry data";
    longDescription = ''
      The OpenTelemetry Collector offers a vendor-agnostic implementation on how
      to receive, process and export telemetry data. In addition, it removes the
      need to run, operate and maintain multiple agents/collectors in order to
      support open-source telemetry data formats (e.g. Jaeger, Prometheus, etc.)
      sending to multiple open-source or commercial back-ends.
    '';
    license = licenses.asl20;
    maintainers = with maintainers; [ uri-canva jk ];
  };
}
