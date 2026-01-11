# 🚀 COMO EXECUTAR NO GITHUB

## ✅ Pré-requisitos

- ✅ Workflows configurados (já feito)
- ✅ Push feito (já feito - commit `79551a7`)
- ✅ Variáveis de ambiente configuradas

---

## 📋 Passo 1: GitHub Stats SVG Workflow

1. **Abra seu repositório no GitHub:**

   ```
   https://github.com/elizabetefabri/ElizabeteFabri
   ```

2. **Vá para:**

   ```
   Actions → Generate README Cards (SVG)
   ```

3. **Clique em:**

   ```
   "Run workflow" → Run workflow (botão verde)
   ```

4. **Aguarde** ~2-3 minutos

5. **Verifique os SVGs gerados em:**
   ```
   .github/assets/output/
   ```

---

## 🎮 Passo 2: Pacman Contribution Graph Workflow

1. **Vá para:**

   ```
   Actions → Generate pacman animation
   ```

2. **Clique em:**

   ```
   "Run workflow" → Run workflow
   ```

3. **Aguarde** ~5-10 minutos (consome mais recursos)

4. **Verifique o resultado em:**
   ```
   Branch: output (novo arquivo pacman-contribution-graph.svg)
   ```

---

## 📊 O que será gerado

### Stats Workflow gera:

- ✅ `.github/assets/output/streak.svg` (7.1 KB)
- ✅ `.github/assets/output/activity-graph.svg` (18.2 KB)
- ✅ `.github/assets/output/stats.svg` (seu fork)
- ✅ `.github/assets/output/top-langs.svg` (seu fork)

### Pacman Workflow gera:

- ✅ `dist/pacman-contribution-graph.svg`
- ✅ Push automático para branch `output`

---

## 🎨 Usar as imagens no README.md

Exemplo:

```markdown
## 📊 Estatísticas

![GitHub Streak](https://github.com/elizabetefabri/ElizabeteFabri/blob/main/.github/assets/output/streak.svg)

![GitHub Stats](https://github.com/elizabetefabri/ElizabeteFabri/blob/main/.github/assets/output/stats.svg)

![Top Languages](https://github.com/elizabetefabri/ElizabeteFabri/blob/main/.github/assets/output/top-langs.svg)

![Activity Graph](https://github.com/elizabetefabri/ElizabeteFabri/blob/main/.github/assets/output/activity-graph.svg)

![Pacman Graph](https://github.com/elizabetefabri/ElizabeteFabri/blob/output/dist/pacman-contribution-graph.svg)
```

---

## ⏰ Agendamento Automático

Os workflows rodão **automaticamente**:

- **Stats:** A cada 12 horas (cron: `0 */12 * * *`)
- **Pacman:** 1º de janeiro a cada ano (cron: `0 0 1 1 *`)

Você também pode triggerar **manualmente** a qualquer momento.

---

## ✨ Resumo

| Ação         | Como fazer                                         |
| ------------ | -------------------------------------------------- |
| Rodar Stats  | Actions → Generate README Cards → Run workflow     |
| Rodar Pacman | Actions → Generate pacman animation → Run workflow |
| Ver SVGs     | `.github/assets/output/` (branch main)             |
| Ver Pacman   | `dist/` ou branch `output`                         |
| Automático   | Runs na agenda pré-configurada                     |

---

## 🎯 Pronto!

Seu repositório está **100% configurado**. Basta clicar em "Run workflow" no GitHub Actions! 🚀
