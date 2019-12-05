map global normal '#' :comment-line<ret>

# Yank
hook global NormalKey '[ydc]' %{
  nop %sh{
    (printf '%s' "$kak_main_reg_dquote" | xclip -filter | xclip -selection clipboard) < /dev/null > /dev/null 2>&1 &
  }
}

# Paste
map global user p -docstring 'Paste (After)' '<a-!>xclip -out -selection clipboard<ret>'
map global user P -docstring 'Paste (Before)' '!xclip -out -selection clipboard<ret>'
map global user R -docstring 'Replace' '|xclip -out -selection clipboard<ret>'
