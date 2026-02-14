function load_env --description 'Load environment variables from a file'
  set -l env_file .env
  if count $argv > /dev/null
    set env_file $argv[1]
  end

  if not test -f $env_file
    echo "Error: $env_file not found" 1>&2
    return 1
  end

  while read -l line
    # Skip comments and empty lines
    if string match -qr '^\s*(#|$)' "$line"
      continue
    end

    # Remove 'export ' prefix if present, then split on first '='
    set -l pair (string replace -r '^export\s+' '' $line | string split -m 1 '=')

    if test (count $pair) -eq 2
      # Trim whitespace and common quotes
      set -l key (string trim $pair[1])
      set -l value (string trim -c '"\'' $pair[2])
      set -gx $key $value
    end
  end < $env_file
end
