#
# Vim Configuration
#

{% set dirs = [
  ".vim",
  ".vim/tmp/",
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
{% end for %}

# Clone Vundle
chris_vim_vundle_clone:
  git:
    - latest
    - name: git://github.com/gmarik/vundle.git
    - target: /home/vagrant/.vim/bundle
    - runas: vagrant
    - require:
      - file:  /home/vagrant/.vim/bundle
      - pkg: chris_vim_git_install

# Vim Config File
chris_vim_vimrc:
  file:
    - managed
    - name: /home/vagrant/.vimrc
    - source: salt://dev_vim/files/.vimrc
    - user: vagrant
    - group: vagrant
    - mode: 755
