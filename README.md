# 🚀 TKAFSJanelaModal

Componente Delphi/FireMonkey para exibição de janelas modais personalizáveis com suporte multiplataforma.

## 📋 Descrição

Componente especializado em exibir janelas modais em aplicações Delphi/FireMonkey, com layout adaptativo para diferentes plataformas e recursos visuais personalizáveis.

## ✨ Características

- ✅ Layout responsivo adaptado para Windows e Android
- ✅ Título personalizável com fonte destacada
- ✅ Botões de ação configuráveis (voltar e confirmar)
- ✅ Suporte multiplataforma (Windows, Android)
- ✅ Cores totalmente personalizáveis
- ✅ Linha separadora estilizada
- ✅ Integração com componente TKAFSBotao

## 🛠️ Configuração

### Parâmetros Padrão

```
Windows: Layout centralizado com proporção 16:9
Android: Layout que ocupa toda a tela
Fonte do título: Roboto 48px Bold
Alinhamento do título: Centralizado
```

## 📦 Como Usar

### Instanciação Básica

```pascal
var
  JanelaModal: TKAFSJanelaModal;
begin
  JanelaModal := TKAFSJanelaModal.Create(Self);
  try
    JanelaModal.KAFSTelaModalConfig(TAlphaColors.White, TAlphaColors.Blue, 
      'Título da Janela', 'Confirmar');
    JanelaModal.Visible := True;
    // Sua lógica de modal aqui
  finally
    JanelaModal.Free;
  end;
end;
```

### Métodos Principais

| Método | Descrição |
|--------|-----------|
| `Create` | Construtor com criação dos componentes visuais |
| `KAFSTelaModalConfig` | Configura a aparência e conteúdo da janela modal |

### Parâmetros do Método KAFSTelaModalConfig

```pascal
procedure KAFSTelaModalConfig(
  const _cortema1: TAlphaColor;    // Cor dos elementos e texto
  const _cortema2: TAlphaColor;    // Cor de fundo
  const _titulo: String;           // Título da janela
  const _botaoconfirmar: String    // Texto do botão confirmar (vazio oculta o botão)
);
```

## 🔧 Dependências

- `System.Classes`
- `System.UITypes`
- `FMX.Controls`
- `FMX.Graphics`
- `FMX.Layouts`
- `FMX.Objects`
- `FMX.StdCtrls`
- `FMX.Types`
- `UntKAFSBotao` (componente personalizado de botão)

## 🎨 Personalização

### Cores
- Fundo do modal (`_cortema2`)
- Elementos visuais e texto (`_cortema1`)

### Textos
- Título principal (font size 48, bold, centralizado)
- Botão de voltar (fixo como "❮")
- Botão de confirmar (personalizável ou ocultável)

### Layout
- Windows: Modal centralizado com proporção 16:9 e margens
- Android: Modal em tela cheia
- Linha separadora abaixo do título
- Botão voltar alinhado à esquerda do título
- Botão confirmar alinhado à parte inferior

## ⚠️ Comportamento Multiplataforma

- **Windows**: Exibe como janela modal centralizada com margens
- **Android**: Exibe como tela cheia (ocupando todo o espaço disponível)

## 🎯 Funcionalidades

- Exibe título personalizado com formatação destacada
- Botão de voltar pré-configurado com símbolo de seta
- Botão de ação principal configurável ou ocultável
- Interface visualmente consistente entre plataformas
- Layout adaptativo para diferentes tamanhos de tela

---

**Nota:** Este componente é ideal para exibição de diálogos modais, confirmações de ações ou formulários que requerem atenção focada do usuário.
