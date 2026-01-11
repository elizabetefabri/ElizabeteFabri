# 📋 Guia de Testes Locais

## ✅ TESTE 1: SVG Downloads (Stats, Streak, Activity Graph)

```bash
# Copie e cole este comando no terminal:
bash test-local.sh
```

**Resultado esperado:** ✅ Todos os 4 endpoints passam

---

## ⚠️ TESTE 2: Pacman Contribution Graph

```bash
# Copie e cole este comando no terminal:
bash test-pacman.sh
```

**Problema:** A action `abozanona/pacman-contribution-graph@main` consome ~4GB de RAM

---

## 🔧 Soluções para cada erro:

### 1. **Erro 503 do GitHub Readme Stats**

- ❌ Não use: `https://github-readme-stats.vercel.app`
- ✅ Use seu fork: `https://github-readme-stats-sigma-ten-59.vercel.app`
- ✅ Status atual: **FIXADO** - seu workflow já está com a URL correta

### 2. **Erro Pacman (Heap Memory)**

- **Causa:** A action é pesada e requer muita memória
- **Opções:**
  1. **Manter a action** - Pode falhar ocasionalmente, mas workflow continua
  2. **Remover a action** - Se não usar pacman, remova do workflow
  3. **Substituir** - Procure action alternativa no GitHub Marketplace

---

## 📊 Comparação do seu Workflow Atual

### Status dos endpoints:

| Endpoint       | URL                                           | Status        | Teste Local         |
| -------------- | --------------------------------------------- | ------------- | ------------------- |
| Streak         | `github-stats-elizabete.vercel.app`           | ✅ OK         | ✅ PASSOU (7.1 KB)  |
| Activity Graph | `github-readme-activity-graph.vercel.app`     | ✅ OK         | ✅ PASSOU (18.2 KB) |
| GitHub Stats   | `github-readme-stats-sigma-ten-59.vercel.app` | ✅ OK         | ✅ PASSOU (806 B)   |
| Top Languages  | `github-readme-stats-sigma-ten-59.vercel.app` | ✅ OK         | ✅ PASSOU (806 B)   |
| Pacman         | `abozanona/pacman-contribution-graph@main`    | ⚠️ HEAP ERROR | Memory issue        |

---

## 🚀 Próximos Passos

### Opção A: Aceitar o erro Pacman ocasional

- Seu workflow SVG está **100% OK**
- O Pacman pode falhar, mas não quebra o resto

### Opção B: Remover Pacman

Se não quer o gráfico pacman, remova a action do `.github/workflows/pacman.yml`

### Opção C: Aumentar memória do Node.js

Adicionar ao `pacman.yml`:

```yaml
env:
  NODE_OPTIONS: --max-old-space-size=4096
```

---

## 📝 Comandos para copiar e testar:

```bash
# Teste completo dos SVGs
bash test-local.sh

# Diagnóstico do Pacman
bash test-pacman.sh

# Ver arquivos gerados
ls -lh /tmp/github-stats-test/

# Limpar
rm -rf /tmp/github-stats-test /tmp/pacman-test
```

---

## ✨ Resumo Final

- ✅ **SVG Downloads:** Todos funcionando
- ✅ **Seu Fork Stats:** Configurado corretamente
- ⚠️ **Pacman:** Requer atenção (mas opcional)

**Recomendação:** Seu workflow está pronto! Os SVGs vão gerar corretamente. 🎉
