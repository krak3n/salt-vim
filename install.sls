#!stateconf yaml . jinja

#
# Install Vim
#

.python-software-properties:
  pkg:
    - installed

.vim-ppa:
  pkgrepo:
    - managed
    - ppa: hackedbellini/vim
    - require:
      - pkg: .python-software-properties

.vim:
  pkg:
    - installed
    - require:
      - pkgrepo: vim-ppa
