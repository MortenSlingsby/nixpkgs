{ buildPythonPackage, fetchPypi, lib, pytz, requests, colorama, click, pydantic, notebook, tzlocal, jsonpatch, scipy, marshmallow, importlib-metadata, ruamel-yaml, jsonschema, makefun, ipywidgets, pandas, cryptography, altair, typing-extensions, tqdm }:

buildPythonPackage rec {
  pname = "great-expectations";
  version = "0.15.36";

  src = fetchPypi {
    inherit version;
    pname = "great_expectations";
    sha256 = "sha256-WTXI0FV6J542PnXjb/8k2i9V66/yToVllLA3+b3eWIk=";
  };

  propagatedBuildInputs = [
    pytz
    requests
    notebook
    jsonpatch
    importlib-metadata
    jsonschema
    pydantic
    makefun
    ipywidgets
    pandas
    cryptography
    altair
    tzlocal
    ruamel-yaml
    click
    colorama
    typing-extensions
    tqdm
    marshmallow
    scipy
  ];

  postPatch = ''
    substituteInPlace requirements.txt \
      --replace 'ruamel.yaml>=0.16,<0.17.18' 'ruamel.yaml' \
      --replace 'jsonschema>=2.5.1,<=4.7.2' 'jsonschema'
  '';

  doCheck = false;

  meta = {
    description = "Generator for random text that looks like Latin.";
    homepage = "https://github.com/sfischer13/python-lorem";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ kfollesdal ];
  };
}