#
# Vim Configuration
#

{% set dirs = [
  ".vim",
  ".vim/tmp",
  ".vim/bundle",
  ".vim/after",
  ".vim/after/plugin"] %}

{% for dir in dirs %}
/home/vagrant/{{ dir }}:
  file:
    - directory
    - user: vagrant
    - group: vagrant
    - mode: 755
    - makeDirs: True
{% endfor %}

# Vim Config File
local_vim_vimrc:
  file:
    - managed
    - name: /home/vagrant/.vimrc
    - source: salt://local_vim/files/.vimrc
    - user: vagrant
    - group: vagrant
    - mode: 755
