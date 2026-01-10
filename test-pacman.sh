#!/bin/bash
set -euo pipefail

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  TESTE LOCAL - Pacman Contribution Graph                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Criar diretório de teste
mkdir -p /tmp/pacman-test
cd /tmp/pacman-test

# Verificar se o Node.js tem memória suficiente
echo "📊 Verificando recursos disponíveis:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
node --version
echo ""
free -h | head -2
echo ""

echo "⚠️  PROBLEMA: A action abozanona/pacman-contribution-graph@main"
echo "    requer ~4GB de RAM e GitHub Actions runners podem ter limite"
echo ""

echo "🔧 SOLUÇÃO:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "1. Aumentar node memory limit:"
echo "   export NODE_OPTIONS='--max-old-space-size=4096'"
echo ""
echo "2. Ou usar uma action alternativa mais leve"
echo ""

echo "📝 Você pode:"
echo "   a) Manter a action e aceitar o erro ocasional"
echo "   b) Remover do workflow se não precisar"
echo "   c) Usar uma action alternativa (procurar em marketplace)"
echo ""

echo "✅ Os outros SVGs (Streak, Stats, Activity) estão OK"
