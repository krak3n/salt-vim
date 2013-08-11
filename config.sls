#!stateconf yaml . jinja

#
# Vim Configuration
#

.vimrc:
  file:
    - managed
    - name: /home/vagrant/.vimrc
    - source: salt://local_vim/files/.vimrc
    - user: vagrant
    - group: vagrant
    - mode: 755
