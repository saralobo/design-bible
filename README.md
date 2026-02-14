# Design Bible 📖

> Regras absolutas de UI/UX para IAs que criam interfaces no Figma.
> Feito para ser usado com **Cursor IDE** como Cursor Rules (`.mdc`).

---

## O que é isso?

Um repositório de regras de design que funciona como a **"bíblia"** de uma IA assistente de design. Quando estas regras estão ativas no Cursor, a IA segue princípios fundamentais de UI/UX antes de criar qualquer tela.

### O problema que resolve:
IAs conseguem criar interfaces no Figma, mas sem fundamento de design — botões ovais quando deviam ser circulares, cores inconsistentes, CTAs competindo entre si. Este repositório "treina" a IA com regras concretas e verificáveis.

---

## 📁 Estrutura

```
design-bible/
├── .cursor/
│   └── rules/
│       ├── 00-core-principles.mdc      ← Hierarquia, contraste, alinhamento
│       ├── 01-ux-laws.mdc              ← Fitts, Hick, Jakob, Miller, etc.
│       ├── 02-gestalt.mdc              ← Proximidade, similaridade, closure
│       ├── 03-layout-spacing.mdc       ← Grid 8px, auto-layout, safe areas
│       ├── 04-typography.mdc           ← Type scale, pesos, formatação
│       ├── 05-colors.mdc              ← Paleta, contraste, dark mode
│       ├── 06-buttons-cta.mdc         ← Hierarquia, tamanhos, circular
│       ├── 07-forms-inputs.mdc        ← Estados, validação, labels
│       ├── 08-navigation.mdc          ← Bottom nav, tabs, gestos
│       ├── 09-cards-lists.mdc         ← Cards, listas, empty states
│       ├── 10-feedback-states.mdc     ← Toasts, modais, loading
│       ├── 11-motion-transitions.mdc  ← Easing, durações, transições
│       ├── 12-micro-interactions.mdc  ← Framework Dan Saffer, catálogo
│       ├── 13-accessibility.mdc       ← WCAG 2.2, contraste, daltonismo
│       ├── 14-nielsen-heuristics.mdc  ← 10 heurísticas de usabilidade
│       ├── 15-figma-execution.mdc     ← Regras técnicas de API Figma
│       └── 16-anti-patterns.mdc       ← O que NUNCA fazer (erros reais)
├── references/                         ← Screenshots de referência (adicione os seus!)
└── README.md
```

---

## 🚀 Como Usar

### Opção 1: Copiar para seu projeto
1. Clone ou baixe este repositório
2. Copie a pasta `.cursor/rules/` para dentro do seu projeto
3. Abra o projeto no Cursor IDE
4. A IA automaticamente lê as regras antes de cada resposta

### Opção 2: Regras globais do Cursor
1. Clone ou baixe este repositório
2. Copie os arquivos `.mdc` para `~/.cursor/rules/` (pasta global)
3. As regras se aplicam a TODOS os projetos no Cursor

### Opção 3: Referência manual
1. Abra qualquer arquivo `.mdc` e leia as regras
2. Use como checklist antes de criar telas no Figma
3. Compartilhe com seu time

---

## 📚 Fontes e Referências

### Livros:
- "Don't Make Me Think" — Steve Krug
- "The Design of Everyday Things" — Don Norman
- "Microinteractions" — Dan Saffer
- "Refactoring UI" — Adam Wathan & Steve Schoger
- "About Face" — Alan Cooper

### Sites:
- [Laws of UX](https://lawsofux.com) — Jon Yablonski
- [Nielsen Norman Group](https://nngroup.com) — Jakob Nielsen
- [Material Design 3](https://m3.material.io) — Google
- [Apple HIG](https://developer.apple.com/design/human-interface-guidelines)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [Mobbin](https://mobbin.com) — Referências de apps reais

---

## 🤝 Como Contribuir

1. **Fork** este repositório
2. Crie uma **branch** com sua melhoria: `git checkout -b minha-melhoria`
3. Faça suas alterações nos arquivos `.mdc`
4. **Commit**: `git commit -m "Adiciona regra de X"`
5. **Push**: `git push origin minha-melhoria`
6. Abra um **Pull Request**

### O que pode contribuir:
- ✅ Novas regras com fundamentação (cite a fonte)
- ✅ Correções de valores/medidas
- ✅ Screenshots de referência na pasta `references/`
- ✅ Traduções
- ✅ Novos módulos (ex: `17-data-visualization.mdc`)
- ❌ Opiniões sem fundamentação
- ❌ Regras específicas de uma empresa (mantenha genérico)

---

## 📊 Conteúdo por Módulo

| Módulo | Linhas | Tópicos |
|---|---|---|
| 00 Core Principles | ~120 | 4 pilares, mobile rules, checklist |
| 01 UX Laws | ~250 | 12 leis com fórmulas e regras |
| 02 Gestalt | ~220 | 8 princípios com exemplos |
| 03 Layout | ~200 | Grid 8px, auto-layout, viewports |
| 04 Typography | ~200 | Type scale, pesos, formatação |
| 05 Colors | ~200 | Paleta, contraste, dark mode |
| 06 Buttons | ~200 | Hierarquia, circular, estados |
| 07 Forms | ~250 | Inputs, validação, stepper |
| 08 Navigation | ~200 | Bottom nav, tabs, gestos |
| 09 Cards & Lists | ~220 | Cards, listas, skeleton |
| 10 Feedback | ~200 | Toasts, modais, success |
| 11 Motion | ~200 | Easing, durações, Smart Animate |
| 12 Micro-interactions | ~280 | Framework Dan Saffer, 12 patterns |
| 13 Accessibility | ~200 | WCAG 2.2, contraste, focus |
| 14 Nielsen | ~220 | 10 heurísticas com checklists |
| 15 Figma Execution | ~180 | API rules, código correto |
| 16 Anti-Patterns | ~220 | 17 erros documentados |
| **Total** | **~3,560** | **17 módulos** |

---

## 📝 Licença

MIT — Use, modifique, distribua livremente. Credite se puder.

---

## ⭐ Se este repositório te ajudou, deixe uma estrela!

Feito com 💜 para designers e IAs que querem criar interfaces melhores.

