# Sync fish history across concurrent interactive shells.
#
# Fish only imports other sessions' history lazily. By saving after each
# command and merging before each prompt, new commands show up quickly in
# other running fish instances.

if status --is-interactive
  if not set -q DOTFILES_FISH_HISTORY_SYNC_DISABLE
    set -g __dotfiles_history_sync_interval 2
    if set -q DOTFILES_FISH_HISTORY_SYNC_INTERVAL
      set -g __dotfiles_history_sync_interval $DOTFILES_FISH_HISTORY_SYNC_INTERVAL
    end

    if not functions -q __dotfiles_epoch_seconds
      function __dotfiles_epoch_seconds
        if set -q EPOCHSECONDS
          echo $EPOCHSECONDS
        else
          command date +%s
        end
      end
    end

    if not functions -q __dotfiles_history_save
      function __dotfiles_history_save --on-event fish_postexec
        builtin history save >/dev/null 2>&1
      end
    end

    if not functions -q __dotfiles_history_merge
      function __dotfiles_history_merge --on-event fish_prompt
        set -l now (__dotfiles_epoch_seconds)

        if set -q __dotfiles_history_last_merge
          set -l delta (math "$now - $__dotfiles_history_last_merge" 2>/dev/null)
          if test -n "$delta"; and test $delta -lt $__dotfiles_history_sync_interval
            return
          end
        end

        set -g __dotfiles_history_last_merge $now
        builtin history merge >/dev/null 2>&1
      end
    end
  end
end
