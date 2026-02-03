function clone_repo --description 'Clone code.byted.org repo under ~/bytedance'
  if test (count $argv) -eq 0
    echo "Usage: clone_repo <org/repo>" 1>&2
    return 2
  end

  set -l repo $argv[1]
  mkdir -p "$HOME/bytedance"
  pushd "$HOME/bytedance" >/dev/null
  mkdir -p "$repo"
  git clone "https://code.byted.org/$repo" "$repo"
  popd >/dev/null
end
