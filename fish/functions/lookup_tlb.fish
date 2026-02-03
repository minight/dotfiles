function lookup_tlb --description 'cloud_sherlock codebase_from_url.py'
  set -l candidates \
    "$HOME/bytedance/tools/cloud_sherlock" \
    "$HOME/bytedance/bytedance/tools/cloud_sherlock"

  set -l sherlock_dir ""
  for d in $candidates
    if test -d "$d"
      set sherlock_dir "$d"
      break
    end
  end

  test -n "$sherlock_dir"; or begin
    echo "cloud_sherlock dir not found" 1>&2
    return 1
  end

  set -l py (ls -1d $HOME/.local/share/virtualenvs/cloud_sherlock-*/bin/python 2>/dev/null | head -n 1)
  test -n "$py"; or begin
    echo "cloud_sherlock venv python not found" 1>&2
    return 1
  end

  pushd "$sherlock_dir" >/dev/null
  "$py" codebase_from_url.py $argv
  popd >/dev/null
end
