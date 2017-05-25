# .emacs.d

### To use closed emacs environment add below lines to your .bashrc/.zshrc
<code>
alias emacs='if [ .emacs.d/init.el ]; then emacs -nw -q --load .emacs.d/init.el; else emacs -nw; fi'
</code>
