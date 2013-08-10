#
# Vim Dependancies
#

{% set packages = [
  "python",
  "python-dev",
  "python-setuptools",
  "curl",
  "git"] %}

# We need python and various other packages
{% for pkg in packages %}
local_vim_{{ pkg|replace("-", "_") }}_install:
  pkg:
    - installed
    - name: {{ pkg }}
{% endfor %}

# We also need pip
local_vim_pip_install:
  cmd:
    - run
    - name: 'curl -L https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python'
    - unless: 'test -f /usr/local/bin/pip'
    - require:
      {% for pkg in packages %}
      - pkg: local_vim_{{ pkg|replace("-", "_") }}_install
      {% endfor %}

# Pip Packages
{% for pkg in ["flake8", "jedi"] %}
local_vim_{{ pkg }}_install:
  pip:
    - installed
    - name: {{ pkg }}
    - require:
      - cmd: local_vim_pip_install
{% endfor %}
