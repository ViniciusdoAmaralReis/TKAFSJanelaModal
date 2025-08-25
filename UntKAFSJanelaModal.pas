unit UntKAFSJanelaModal;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Controls, FMX.Graphics, FMX.Objects, FMX.StdCtrls, FMX.Types,
  UntKAFSBotao;

type
  TKAFSJanelaModal = class(TRectangle)
    RecCorpo: TRectangle;
    LabTitulo: TLabel;
    BtnVoltar: TKAFSBotao;
    LabIcone: TLabel;
    LinTitulo: TLine;
    BtnConfirmar: TKAFSBotao;

    constructor Create(AOwner: TComponent); override;
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

  RecCorpo := TRectangle.Create(Self);
  with RecCorpo do
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

  LabTitulo := TLabel.Create(Self);
  with LabTitulo do
  begin
    Align := TAlignLayout.MostTop;
    Font.Family := 'Roboto';
    Font.Size := 36;
    Font.Style := [TFontStyle.fsBold];
    Height := 70;
    Parent := RecCorpo;
    StyledSettings := [];
    TextSettings.HorzAlign := TTextAlign.Center;
  end;

  BtnVoltar := TKAFSBotao.Create(LabTitulo);
  with BtnVoltar do
  begin
    Align := TAlignLayout.MostLeft;
    LabDescricao.Text := '❮';
    Width := Height;
  end;

  LabIcone := TLabel.Create(Self);
  with LabIcone do
  begin
    Align := TAlignLayout.MostRight;
    Font.Family := 'Segoe UI Emoji';
    Font.Size := 36;
    Font.Style := [TFontStyle.fsBold];
    Parent := LabTitulo;
    StyledSettings := [];
    TextSettings.HorzAlign := TTextAlign.Center;
    Width := LabTitulo.Height;
  end;

  LinTitulo := TLine.Create(Self);
  with LinTitulo do
  begin
    Align := TAlignLayout.Top;
    Height := 1;
    LineType := TLineType.Bottom;
    Parent := RecCorpo;
  end;

  BtnConfirmar := TKAFSBotao.Create(RecCorpo);
  with BtnConfirmar do
  begin
    Align := TAlignLayout.MostBottom;
    Parent := RecCorpo;
  end;
end;

procedure TKAFSJanelaModal.KAFSJanelaModalConfig(const _cortema1, _cortema2: TAlphaColor; _titulo, _icone: String; _botaoconfirmar: String);
begin
  TThread.Synchronize(nil, procedure
  begin
    // Cor do fundo
    RecCorpo.Fill.Color := _cortema2;

    // Texto e cor da fonte
    with LabTitulo do
    begin
      Text := _titulo;
      TextSettings.FontColor := _cortema1;
    end;

    // Cor do texto do botão
    with BtnVoltar do
    begin
      Fill.Color := _cortema2;
      LabDescricao.FontColor := _cortema1;
    end;

    // Texto e cor da fonte
    with LabIcone do
    begin
      Text := _icone;
      TextSettings.FontColor := _cortema1;
    end;

    // Cor da linha
    LinTitulo.Stroke.Color := _cortema1;

    // Cor dos botões de ação e texto
    with BtnConfirmar do
    begin
      Fill.Color := _cortema1;
      LabDescricao.FontColor := _cortema2;

      // Se a string estiver vazia, indica que o botão não será usado
      if _botaoconfirmar = '' then
        Visible := False
      else
        LabDescricao.Text := _botaoconfirmar;
    end;
  end);
end;

destructor TKAFSJanelaModal.Destroy;
begin
  if Assigned(BtnConfirmar) then
    FreeAndNil(BtnConfirmar);

  if Assigned(LinTitulo) then
    FreeAndNil(LinTitulo);

  if Assigned(LabIcone) then
    FreeAndNil(LabIcone);

  if Assigned(BtnVoltar) then
   FreeAndNil(BtnVoltar);

  if Assigned(LabTitulo) then
    FreeAndNil(LabTitulo);

  if Assigned(RecCorpo) then
    FreeAndNil(RecCorpo);

  inherited Destroy;
end;

end.
