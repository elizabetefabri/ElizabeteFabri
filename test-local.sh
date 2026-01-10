#!/bin/bash
set -euo pipefail

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  TESTE LOCAL - GitHub Stats SVG Download                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Criar diretório de teste
mkdir -p /tmp/github-stats-test
cd /tmp/github-stats-test

fetch_svg_safe() {
  local url="$1"
  local final="$2"
  local tmp="${final}.tmp"
  local max_retries=8
  local retry_delay=5
  local timeout=30

  echo "📥 Downloading: $url"

  rm -f "$tmp"

  if ! curl -L \
    --connect-timeout "$timeout" \
    --max-time 60 \
    --retry "$max_retries" \
    --retry-delay "$retry_delay" \
    --retry-all-errors \
    -H "Accept: image/svg+xml" \
    -H "User-Agent: Mozilla/5.0 (GitHub-Actions)" \
    "$url" -o "$tmp" 2>&1; then
    echo "⚠️  Falha ao baixar: endpoint indisponível ou timeout"
    rm -f "$tmp"
    return 1
  fi

  if ! head -n 10 "$tmp" 2>/dev/null | grep -qiE '(<svg|<\?xml)'; then
    http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "⚠️  Não é SVG válido (HTTP $http_code)"
    echo "---- Resposta recebida ----"
    head -n 20 "$tmp" 2>/dev/null || cat "$tmp"
    rm -f "$tmp"
    return 1
  fi

  bytes=$(wc -c < "$tmp" 2>/dev/null | tr -d ' ')
  if [ "$bytes" -lt 500 ]; then
    echo "⚠️  Arquivo muito pequeno ($bytes bytes)"
    rm -f "$tmp"
    return 1
  fi

  mv "$tmp" "$final"
  echo "✅ Sucesso: $final ($bytes bytes)"
  return 0
}

echo ""
echo "1️⃣  TESTE: GitHub Streak (seu-projeto.vercel.app)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
STREAK_URL="https://github-stats-elizabete.vercel.app/?user=elizabetefabri&theme=dracula&locale=pt_BR&type=svg"
if fetch_svg_safe "$STREAK_URL" "streak.svg"; then
  echo "✅ PASSOU"
else
  echo "❌ FALHOU"
fi
echo ""

echo "2️⃣  TESTE: Activity Graph"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ACTIVITY_GRAPH_URL="https://github-readme-activity-graph.vercel.app/graph?username=elizabetefabri&bg_color=1F222E&color=ff8899&border_color=ff8899&title_color=ff8888&line=ff8899&point=fefefe&area=true&hide_border=false"
if fetch_svg_safe "$ACTIVITY_GRAPH_URL" "activity-graph.svg"; then
  echo "✅ PASSOU"
else
  echo "❌ FALHOU"
fi
echo ""

echo "3️⃣  TESTE: GitHub Stats (seu fork)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
STATS_URL="https://github-readme-stats-sigma-ten-59.vercel.app/api?username=elizabetefabri&show_icons=true&theme=tokyonight&cache_seconds=21600"
if fetch_svg_safe "$STATS_URL" "stats.svg"; then
  echo "✅ PASSOU"
else
  echo "❌ FALHOU"
fi
echo ""

echo "4️⃣  TESTE: Top Languages (seu fork)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
TOP_LANGS_URL="https://github-readme-stats-sigma-ten-59.vercel.app/api/top-langs/?username=elizabetefabri&layout=compact&theme=tokyonight&cache_seconds=21600"
if fetch_svg_safe "$TOP_LANGS_URL" "top-langs.svg"; then
  echo "✅ PASSOU"
else
  echo "❌ FALHOU"
fi
echo ""

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  RESULTADO FINAL                                           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
ls -lh *.svg 2>/dev/null || echo "❌ Nenhum SVG gerado"
echo ""
echo "📁 Arquivos em: /tmp/github-stats-test/"
echo "🧹 Para limpar: rm -rf /tmp/github-stats-test"
