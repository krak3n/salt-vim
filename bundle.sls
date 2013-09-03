#!stateconf yaml . jinja

#
# local_vim.bundles
#
# Installs vim bundle dependencies
#

# Dependencies

.curl:
  pkg:
    - installed

.python:
  pkg:
    - installed

.python-dev:
  pkg:
    - installed

.setuptools:
  cmd:
    - run
    - name: 'curl -L https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python'
    - unless: 'python -c "import setuptools"'
    - require:
      - pkg: .curl
      - pkg: .python
      - pkg: .python-dev

.pip:
  cmd:
    - run
    - name: 'curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python'
    - unless: 'test -f /usr/local/bin/pip'
    - require:
      - pkg: .curl
      - pkg: .python
      - pkg: .python-dev
      - cmd: .setuptools

# Pip Packages

.flake8:
  pip:
    - installed
    - require:
      - cmd: .pip

.jedi:
  pip:
    - installed
    - require:
      - cmd: .pip
