unit KM_GUIMenuSinglePlayer;
{$I KaM_Remake.inc}
interface
uses
  Controls, Math, SysUtils,
  KM_Defaults,
  KM_Controls, KM_Pics, KM_InterfaceDefaults;


type
  TKMGUIMenuSinglePlayer = class
  private
    fOnPageChange: TGUIEventText;

    procedure ButtonClick(Sender: TObject);
  protected
    Panel_SinglePlayer: TKMPanel;
    Panel_SPButtons: TKMPanel;
    Button_SP_Tutor: TKMButton;
    Button_SP_Fight: TKMButton;
    Button_SP_Camp: TKMButton;
    Button_SP_Single: TKMButton;
    Button_SP_Load: TKMButton;
    Button_SP_Back: TKMButton;
  public
    constructor Create(aParent: TKMPanel; aOnPageChange: TGUIEventText);

    procedure Show;
  end;


implementation
uses KM_ResTexts, KM_GameApp, KM_RenderUI, KM_ResFonts;


{ TKMGUIMenuSinglePlayer }
constructor TKMGUIMenuSinglePlayer.Create(aParent: TKMPanel; aOnPageChange: TGUIEventText);
begin
  inherited Create;

  fOnPageChange := aOnPageChange;

  //Without anchors this page is centered on resize
  Panel_SinglePlayer := TKMPanel.Create(aParent, 0, 0, aParent.Width, aParent.Height);
  Panel_SinglePlayer.Anchors := [];
    TKMImage.Create(Panel_SinglePlayer, 300, 120, 423, 164, 4, rxGuiMain);
    TKMLabel.Create(Panel_SinglePlayer, 512, 300, 'Remake', fnt_Metal, taCenter);
    with TKMImage.Create(Panel_SinglePlayer, 50, 220, Round(218 * 1.3), Round(291 * 1.3), 5, rxGuiMain) do ImageStretch;
    with TKMImage.Create(Panel_SinglePlayer, 705, 220, Round(207 * 1.3), Round(295 * 1.3), 6, rxGuiMain) do ImageStretch;

    Panel_SPButtons := TKMPanel.Create(Panel_SinglePlayer,337,340,350,400);
      Button_SP_Tutor  := TKMButton.Create(Panel_SPButtons,0,  0,350,30,gResTexts[TX_MENU_TUTORIAL_TOWN],bsMenu);
      Button_SP_Fight  := TKMButton.Create(Panel_SPButtons,0, 40,350,30,gResTexts[TX_MENU_TUTORIAL_BATTLE],bsMenu);
      Button_SP_Camp   := TKMButton.Create(Panel_SPButtons,0,100,350,30,gResTexts[TX_MENU_CAMPAIGNS],bsMenu);
      Button_SP_Single := TKMButton.Create(Panel_SPButtons,0,160,350,30,gResTexts[TX_MENU_SINGLE_MAP],bsMenu);
      Button_SP_Load   := TKMButton.Create(Panel_SPButtons,0,200,350,30,gResTexts[TX_MENU_LOAD_SAVEGAME],bsMenu);
      Button_SP_Back   := TKMButton.Create(Panel_SPButtons,0,290,350,30,gResTexts[TX_MENU_BACK],bsMenu);

      Button_SP_Tutor.OnClick  := ButtonClick;
      Button_SP_Fight.OnClick  := ButtonClick;
      Button_SP_Camp.OnClick   := ButtonClick;
      Button_SP_Single.OnClick := ButtonClick;
      Button_SP_Load.OnClick   := ButtonClick;
      Button_SP_Back.OnClick   := ButtonClick;
end;


procedure TKMGUIMenuSinglePlayer.ButtonClick(Sender: TObject);
begin
  if Sender = Button_SP_Tutor then
    fGameApp.NewSingleMap(ExeDir + 'Tutorials'+PathDelim+'Town Tutorial'+PathDelim+'Town Tutorial.dat', gResTexts[TX_MENU_TUTORIAL_TOWN]);

  if Sender = Button_SP_Fight then
    fGameApp.NewSingleMap(ExeDir + 'Tutorials'+PathDelim+'Battle Tutorial'+PathDelim+'Battle Tutorial.dat', gResTexts[TX_MENU_TUTORIAL_BATTLE]);

  if Sender = Button_SP_Camp then
    fOnPageChange(gpCampSelect);

  if Sender = Button_SP_Single then
    fOnPageChange(gpSingleMap);

  if Sender = Button_SP_Load then
    fOnPageChange(gpLoad);

  if Sender = Button_SP_Back then
    fOnPageChange(gpMainMenu);
end;


procedure TKMGUIMenuSinglePlayer.Show;
begin
  Panel_SinglePlayer.Show;
end;


end.