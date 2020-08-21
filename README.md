## pytemplate

template for a typical python package with config for tess format and type verification

### Development

#### Installing sources projects

Get the project and create the virtual env:
```sh
git clone https://github.com/vche/pkg_name
virtualenv pyvenv
. pyvenv/bin/activate
pip install -e .
```

Note: Entry points will be installed in pyvenv/bin, libs with pyvenv libs

#### Run tests

```sh
pip install tox sphinx sphinx_rtd_theme pip install m2r
tox
```

#### Generate documentation:

```sh
pip install sphinx sphinx_rtd_theme m2r
./setup.py doc
```

In case new classes/modules are added, update the autodoc list:
```
sphinx-apidoc -f -o docs/sphinx_conf/source/ src/pkg_name
```
