#!/usr/bin/env bash
set -euo pipefail
cd /opt/avacity/base
FFDEC="java -Djava.awt.headless=true -jar /opt/avacity/base/tools/ffdec/ffdec-cli.jar"
IN="files/pnz-city.swf"
OUT="files/pnz-city.patched.swf"
AS="tools/a2_nops.as"
SCRIPT=$'§_-CKK§.§_-a2§'

echo "Replacing $SCRIPT ..."
$FFDEC -config autoDeobfuscate=0,simplifyExpressions=0 -replace "$IN" "$OUT" "$SCRIPT" "$AS"
ls -la "$OUT"
echo DONE
