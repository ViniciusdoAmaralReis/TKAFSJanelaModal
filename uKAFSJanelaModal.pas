unit uKAFSJanelaModal;

interface

uses
  System.Classes, System.UITypes,
  FMX.Controls, FMX.Graphics, FMX.Objects, FMX.StdCtrls, FMX.Types,
  uKAFSBotao;

type
  TKAFSJanelaModal = class(TRectangle)
    recCorpo: TRectangle;
    recTitulo: TRectangle;
    btnVoltar: TKAFSBotao;
    labTitulo: TLabel;
    recImagem: TRectangle;
    imgImagem: TImage;
    btnConfirmar: TKAFSBotao;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure KAFSJanelaModalConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogo: TBitmap; const _titulo, _txtbotao: String);
    destructor Destroy; override;
  end;

implementation

constructor TKAFSJanelaModal.Create(AOwner: TComponent);
begin
  TThread.Synchronize(nil, procedure
  begin
    inherited Create(AOwner);

    if AOwner is TControl then
      Self.Parent := TControl(AOwner);

    Self.Align := TAlignLayout.Contents;
    Self.Fill.Color := $FF323232;
    Self.Visible := False;

    recCorpo := TRectangle.Create(Self);
    recCorpo.Parent := Self;
    recCorpo.Stroke.Kind := TBrushKind.None;
    // No Windows a tela ocupa o centro
    {$IFDEF MSWINDOWS}
    recCorpo.Align := TAlignLayout.HorzCenter;
    recCorpo.Height := TControl(AOwner).Height;
    recCorpo.Margins.Bottom := recCorpo.Height / 10;
    recCorpo.Margins.Top := recCorpo.Height / 10;
    recCorpo.Width := (recCorpo.Height / 16) * 9;
    {$ENDIF}
    // No Android a tela ocupa todo o espaço
    {$IFDEF ANDROID}
    rectCorpo.Align := TAlignLayout.Client;
    {$ENDIF}

    recTitulo := TRectangle.Create(Self);
    recTitulo.Align := TAlignLayout.MostTop;
    recTitulo.Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    recTitulo.Height := 70;
    recTitulo.Parent := recCorpo;
    recTitulo.Stroke.Kind := TBrushKind.None;
    recTitulo.XRadius := 25;
    recTitulo.YRadius := 25;

    btnVoltar := TKAFSBotao.Create(recTitulo);
    btnVoltar.Align := TAlignLayout.MostLeft;
    btnVoltar.LabDescricao.Text := '❮';
    btnVoltar.Width := 50;

    labTitulo := TLabel.Create(Self);
    labTitulo.Align := TAlignLayout.Contents;
    labTitulo.Font.Family := 'Roboto';
    labTitulo.Font.Size := 26;
    labTitulo.Font.Style := [TFontStyle.fsBold];
    labTitulo.Margins.Left := btnVoltar.Width;
    labTitulo.Parent := recTitulo;
    labTitulo.StyledSettings := [];
    labTitulo.TextSettings.HorzAlign := TTextAlign.Leading;

    recImagem := TRectangle.Create(Self);
    recImagem.Align := TAlignLayout.MostRight;
    recImagem.Fill.Color := TAlphaColors.White;
    recImagem.Height := 100;
    recImagem.Margins.Bottom := -30;
    recImagem.Parent := recTitulo;
    recImagem.Stroke.Thickness := 10;
    recImagem.Width := 100;
    recImagem.XRadius := 25;
    recImagem.YRadius := 25;

    imgImagem := TImage.Create(Self);
    imgImagem.Align := TAlignLayout.Client;
    imgImagem.Margins.Bottom := 20;
    imgImagem.Margins.Left := 20;
    imgImagem.Margins.Right := 20;
    imgImagem.Margins.Top := 20;
    imgImagem.Parent := recImagem;
    imgImagem.WrapMode := TImageWrapMode.Fit;

    btnConfirmar := TKAFSBotao.Create(recCorpo);
    btnConfirmar.Align := TAlignLayout.MostBottom;
    btnConfirmar.Margins.Bottom := 20;
    btnConfirmar.Margins.Left := 20;
    btnConfirmar.Margins.Right := 20;
    btnConfirmar.Margins.Top := 20;
    btnConfirmar.Parent := recCorpo;
    btnConfirmar.XRadius := 25;
    btnConfirmar.YRadius := 25;
  end);
end;

procedure TKAFSJanelaModal.KAFSJanelaModalConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogo: TBitmap; const _titulo, _txtbotao: String);
begin
  TThread.Synchronize(nil, procedure
  begin
    // Configura componentes
    recCorpo.Fill.Color := _cortema2;
    recTitulo.Fill.Color := _cortema1;
    btnVoltar.Fill.Color := TAlphaColors.Null;
    btnVoltar.labDescricao.FontColor := _cortema2;
    labTitulo.Text := _titulo;
    labTitulo.TextSettings.FontColor := _cortema2;
    recImagem.Stroke.Color := _cortema1;
    imgImagem.Bitmap := _imgLogo;
    btnConfirmar.Fill.Color := _cortema1;
    btnConfirmar.labDescricao.FontColor := _cortema2;

    // Se a string estiver vazia, indica que o botão não será usado
    if _txtbotao = '' then
      btnConfirmar.Visible := False
    else
      btnConfirmar.labDescricao.Text := _txtbotao;
  end);
end;

destructor TKAFSJanelaModal.Destroy;
begin

  inherited Destroy;
end;

end.
