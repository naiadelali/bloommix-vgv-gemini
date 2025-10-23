# 🌱 Bloomix Design System

Sistema de Design completo para o app Bloomix - Identificador de Plantas com IA.

## 📦 Estrutura

```
bloomix_ds/
├── lib/
│   ├── tokens/
│   │   ├── colors.dart      # Paleta de cores
│   │   ├── typography.dart  # Tipografia
│   │   ├── spacing.dart     # Espaçamentos
│   │   └── sizing.dart      # Tamanhos
│   ├── components/
│   │   ├── buttons.dart     # Botões
│   │   └── cards.dart       # Cards
│   ├── theme/
│   │   └── bloomix_theme.dart # Tema completo
│   └── bloomix_ds.dart      # Exportações principais
```

## 🎨 Tokens

### Cores
- **Primary**: Verde (natureza) - persistente com o tema botânico
- **Secondary**: Azul (céu) - complementar
- **Neutral**: Cinza - para textos e backgrounds
- **Semantic**: Success, Warning, Error, Info

### Tipografia
- **Display**: Para títulos principais (32px, 28px, 24px)
- **Headline**: Para cabeçalhos (22px, 20px, 18px)
- **Title**: Para títulos de seções (17px, 16px, 14px)
- **Body**: Para texto corrido (16px, 14px, 12px)
- **Label**: Para etiquetas (14px, 12px, 11px)

### Espaçamento
Baseado em múltiplos de 8px:
- **xs**: 2px
- **sm**: 4px
- **md**: 8px
- **lg**: 12px
- **xl**: 16px
- **xxl**: 20px
- **xxxl**: 24px
- **huge**: 32px

### Tamanhos
- **Ícones**: 12px até 48px
- **Avatars**: 24px até 96px
- **Botões**: 28px até 56px
- **Border Radius**: 2px até 32px
- **Elevação**: 1px até 24px

## 🧩 Componentes

### Botões
```dart
BloomixButton(
  text: 'Identificar Planta',
  onPressed: () {},
  variant: BloomixButtonVariant.primary,
  size: BloomixButtonSize.medium,
  icon: Icons.camera_alt,
)
```

### Cards
```dart
BloomixCard(
  child: Text('Conteúdo do card'),
  elevation: BloomixCardElevation.medium,
  onTap: () {},
)

BloomixPlantCard(
  plantName: 'Rosa',
  scientificName: 'Rosa spp.',
  confidence: 0.95,
  identifiedAt: DateTime.now(),
)
```

### FAB
```dart
BloomixFab(
  onPressed: () {},
  icon: Icons.add,
  variant: BloomixFabVariant.primary,
)
```

## 🎭 Tema

### Uso
```dart
MaterialApp(
  theme: BloomixTheme.lightTheme,
  darkTheme: BloomixTheme.darkTheme,
  // ...
)
```

## 📱 Uso no App

```dart
import 'package:bloomix_ds/bloomix_ds.dart';

// Usar tokens
Container(
  padding: EdgeInsets.all(BloomixSpacing.xl),
  margin: EdgeInsets.all(BloomixSpacing.md),
  decoration: BoxDecoration(
    color: BloomixColors.primary500,
    borderRadius: BorderRadius.circular(BloomixSizing.radiusMd),
  ),
  child: Text(
    'Identificar Planta',
    style: BloomixTypography.titleLarge,
  ),
)

// Usar componentes
BloomixButton(
  text: 'Identificar',
  onPressed: identifyPlant,
  variant: BloomixButtonVariant.primary,
)
```

## 🎯 Princípios

1. **Consistência**: Todos os elementos seguem o mesmo padrão visual
2. **Acessibilidade**: Cores e contrastes adequados
3. **Escalabilidade**: Sistema modular e extensível
4. **Natureza**: Tema inspirado no mundo botânico
5. **Usabilidade**: Componentes intuitivos e funcionais

## 🔧 Desenvolvimento

Para adicionar novos tokens ou componentes:

1. **Tokens**: Adicione em `lib/tokens/`
2. **Componentes**: Adicione em `lib/components/`
3. **Export**: Adicione em `lib/bloomix_ds.dart`
4. **Documentação**: Atualize este README

## 📋 Checklist de Uso

- ✅ Usar apenas tokens do Design System
- ✅ Não usar valores hardcoded (cores, tamanhos, espaçamentos)
- ✅ Seguir a hierarquia tipográfica
- ✅ Usar componentes pré-definidos quando possível
- ✅ Manter consistência visual em todo o app

