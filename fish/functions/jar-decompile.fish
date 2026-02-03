function jar-decompile --description 'Decompile jar using CFR/JetBrains tool'
  if test (count $argv) -lt 2
    echo "Usage: jar-decompile <src.jar> <dst_dir>" 1>&2
    return 2
  end

  set -l jar "$argv[1]"
  set -l dst "$argv[2]"
  set -l decompiler_jar "/usr/local/bin/java-decompiler.jar"

  if not test -f "$decompiler_jar"
    echo "Missing $decompiler_jar" 1>&2
    return 1
  end

  java -cp "$decompiler_jar" \
    org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler \
    -dgs=true \
    "$jar" "$dst"
end
