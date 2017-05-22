object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MesMots: TMemo
    Left = 0
    Top = 0
    Width = 273
    Height = 73
    Lines.Strings = (
      'MesMots')
    TabOrder = 0
    Visible = False
  end
  object Panel1: TPanel
    Left = 112
    Top = 40
    Width = 313
    Height = 161
    TabOrder = 1
    object Label1: TLabel
      Left = 130
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Taille :'
    end
    object BullsnCowLabel: TLabel
      Left = 240
      Top = 32
      Width = 52
      Height = 13
      Caption = 'Bulls / Cow'
    end
    object Chaine: TEdit
      Left = 104
      Top = 63
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object cmdLancement: TButton
      Left = 24
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Commencer'
      TabOrder = 1
      OnClick = cmdLancementClick
    end
    object NbTaille: TEdit
      Left = 167
      Top = 29
      Width = 28
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object cmdValider: TButton
      Left = 120
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Valider'
      Enabled = False
      TabOrder = 3
      OnClick = cmdValiderClick
    end
    object NbBulls: TEdit
      Left = 240
      Top = 51
      Width = 17
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object NbCow: TEdit
      Left = 272
      Top = 51
      Width = 17
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object MaVie: TEdit
      Left = 255
      Top = 112
      Width = 28
      Height = 25
      Enabled = False
      TabOrder = 6
    end
    object Quitter: TButton
      Left = 24
      Top = 27
      Width = 75
      Height = 25
      Caption = 'Quitter'
      TabOrder = 7
      OnClick = QuitterClick
    end
  end
end
