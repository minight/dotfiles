function gpy --description 'Start poetry shell for ~/tools/shell/py'
  set -l proj "$HOME/tools/shell/py"
  if not test -d "$proj"
    echo "Missing $proj" 1>&2
    return 1
  end
  pipx run poetry -C "$proj" shell
end
