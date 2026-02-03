if status --is-interactive
  set -g fish_greeting

  # Fortune, similar to prezto zlogin behavior.
  if type -q fortune
    fortune -s
    echo
  end
end

# Print a goodbye message, similar to prezto zlogout.
function __dotfiles_fish_goodbye --on-event fish_exit
  if status --is-interactive
    set -l sayings \
      "So long and thanks for all the fish.\n  -- Douglas Adams" \
      "Good morning! And in case I don't see ya, good afternoon, good evening and goodnight.\n  -- Truman Burbank"
    echo $sayings[(random 1 (count $sayings))] 1>&2
  end
end
