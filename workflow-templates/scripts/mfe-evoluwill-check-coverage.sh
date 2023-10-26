#!/bin/bash
COVERAGE_THRESHOLD=80
if [ -f ./coverage/coverage-summary.json ]; then
COVERAGE=$(jq -r '.total.lines.pct' ./coverage/coverage-summary.json)

if (( $(echo "$COVERAGE < $COVERAGE_THRESHOLD" | bc -l) )); then
    echo "Erro: Cobertura insuficiente ($COVERAGE%). O mínimo é de $COVERAGE_THRESHOLD%."
    exit 1
else
    echo "Cobertura atende aos requisitos ($COVERAGE%)."
fi
else
echo "Erro: Arquivo de cobertura não encontrado."
exit 1
fi
