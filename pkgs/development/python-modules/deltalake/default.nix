{ lib
, buildPythonPackage
, fetchFromGitHub
, fetchPypi
, fetchurl
, pyarrow
, pytestCheckHook
}:

# buildPythonPackage rec {
#   pname = "deltalake";
#   version = "0.9.0";

#   src = fetchPypi {
#     inherit pname version;
#     sha256 = "sha256-FjQ4AiAFHnu9P0sLa1kBxGtirYMm/V2pGwMujTGCFvU=";
#   };

#   pythonImportsCheck = [ "deltalake" ];

#   propagatedBuildInputs = [ pyarrow ];

#   checkInputs = [
#     pytestCheckHook
#   ];

#   meta = with lib; {
#     description = "A native Rust library for Delta Lake, with bindings into Python";
#     homepage = "https://github.com/delta-io/delta-rs";
#     license = licenses.asl20;
#     maintainers = with maintainers; [ mslingsby kfollesdal ];
#   };
# }

buildPythonPackage rec {
  pname = "deltalake";
  version = "0.6.4";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/36/9a/5d6bfbfbbec53a56d7f207bbb3ef32816a4ab4a9de630a209ee0e2b14823/deltalake-0.6.4-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
    sha256 = "sha256-9UuhQlHMTSyvI/82peEEUlDc1A5eXTMEBqw8aRQ/wYg=";
  };

  pythonImportsCheck = [ "deltalake" ];

  propagatedBuildInputs = [ pyarrow ];
}
