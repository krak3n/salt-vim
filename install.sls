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
    - ppa: nmi/vim-snapshots
    - require:
      - pkg: .python-software-properties

.vim:
  pkg:
    - installed
    - require:
      - pkgrepo: vim-ppa
