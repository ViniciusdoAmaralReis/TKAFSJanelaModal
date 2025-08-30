unit uKAFSJanelaModal;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Controls, FMX.Graphics, FMX.Objects, FMX.StdCtrls, FMX.Types,
  uKAFSBotao;

type
  TKAFSJanelaModal = class(TRectangle)
    rectCorpo: TRectangle;
    labTitulo: TLabel;
    btnVoltar: TKAFSBotao;
    labIcone: TLabel;
    linTitulo: TLine;
    btnConfirmar: TKAFSBotao;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure KAFSJanelaModalConfig(const _cortema1, _cortema2: TAlphaColor; _titulo, _icone: String; _botaoconfirmar: String);
    destructor Destroy; override;
  end;

implementation

constructor TKAFSJanelaModal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  if AOwner is TControl then
    Parent := TControl(AOwner);

  Align := TAlignLayout.Contents;
  Fill.Color := $64000000;
  Visible := False;

  rectCorpo := TRectangle.Create(Self);
  with rectCorpo do
  begin
    Parent := Self;
    Stroke.Kind := TBrushKind.None;
    {$IFDEF MSWINDOWS}
    // No Windows a tela ocupa o centro
    Align := TAlignLayout.HorzCenter;
    Height := TControl(AOwner).Height;
    Margins.Bottom := Height / 10;
    Margins.Top := Height / 10;
    Width := (Height / 16) * 9;
    {$ENDIF}
    {$IFDEF ANDROID}
    // No Android a tela ocupa todo o espaço
    Align := TAlignLayout.Client;
    {$ENDIF}
  end;

  labTitulo := TLabel.Create(Self);
  with labTitulo do
  begin
    Align := TAlignLayout.MostTop;
    Font.Family := 'Roboto';
    Font.Size := 28;
    Font.Style := [TFontStyle.fsBold];
    Height := 70;
    Parent := rectCorpo;
    StyledSettings := [];
    TextSettings.HorzAlign := TTextAlign.Center;
  end;

  btnVoltar := TKAFSBotao.Create(LabTitulo);
  with btnVoltar do
  begin
    Align := TAlignLayout.MostLeft;
    LabDescricao.Text := '❮';
    Width := Height;
  end;

  labIcone := TLabel.Create(Self);
  with labIcone do
  begin
    Align := TAlignLayout.MostRight;
    Font.Family := 'Segoe UI Emoji';
    Font.Size := 28;
    Font.Style := [TFontStyle.fsBold];
    Parent := LabTitulo;
    StyledSettings := [];
    TextSettings.HorzAlign := TTextAlign.Center;
    Width := LabTitulo.Height;
  end;

  linTitulo := TLine.Create(Self);
  with linTitulo do
  begin
    Align := TAlignLayout.Top;
    Height := 1;
    LineType := TLineType.Bottom;
    Parent := rectCorpo;
  end;

  btnConfirmar := TKAFSBotao.Create(rectCorpo);
  with btnConfirmar do
  begin
    Align := TAlignLayout.MostBottom;
    Parent := rectCorpo;
  end;
end;

procedure TKAFSJanelaModal.KAFSJanelaModalConfig(const _cortema1, _cortema2: TAlphaColor; _titulo, _icone: String; _botaoconfirmar: String);
begin
  TThread.Synchronize(nil, procedure
  begin
    // Cor do fundo
    rectCorpo.Fill.Color := _cortema2;

    // Texto e cor da fonte
    with labTitulo do
    begin
      Text := _titulo;
      TextSettings.FontColor := _cortema1;
    end;

    // Cor do texto do botão
    with btnVoltar do
    begin
      Fill.Color := _cortema2;
      LabDescricao.FontColor := _cortema1;
    end;

    // Texto e cor da fonte
    with labIcone do
    begin
      Text := _icone;
      TextSettings.FontColor := _cortema1;
    end;

    // Cor da linha
    linTitulo.Stroke.Color := _cortema1;

    // Cor dos botões de ação e texto
    with btnConfirmar do
    begin
      Fill.Color := _cortema1;
      labDescricao.FontColor := _cortema2;

      // Se a string estiver vazia, indica que o botão não será usado
      if _botaoconfirmar = '' then
        Visible := False
      else
        labDescricao.Text := _botaoconfirmar;
    end;
  end);
end;

destructor TKAFSJanelaModal.Destroy;
begin

  inherited Destroy;
end;

end.
