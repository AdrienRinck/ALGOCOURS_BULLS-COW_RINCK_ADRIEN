unit BullsAndCowCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    MesMots: TMemo;
    Panel1: TPanel;
    Chaine: TEdit;
    cmdLancement: TButton;
    Label1: TLabel;
    NbTaille: TEdit;
    cmdValider: TButton;
    BullsnCowLabel: TLabel;
    NbBulls: TEdit;
    NbCow: TEdit;
    MaVie: TEdit;
    Quitter: TButton;
    LabelVie: TLabel;
    procedure FormCreate(Sender: TObject);
    Procedure MotATrouver(Sender: TObject; var Taille:integer);
    procedure cmdLancementClick(Sender: TObject);
    procedure cmdValiderClick(Sender: TObject);
    Procedure Bulls(Sender:TObject;var BullsNb:integer);
    Procedure Cows(Sender:TObject;var CowsNb:integer);
    Function ValidationInputAlphabet():Boolean;
    Function ValidationInputTaille():Boolean;
    Function ValidationInputLettre():Boolean;
    Function Victoire():Boolean;
    Function Defaite():Boolean;
    procedure QuitterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;
Const NbMot=10;
      Min=1;
      Alphabet='abcdefghijklmnopqrstuvwxyz';
var
  Form2: TForm2;
  MotADeviner,MaChaine:string;
  BullsNb,CowsNb,Taille,Vie:integer;

implementation

{$R *.dfm}
//---------- Initialisation des mots a deviner ----------//
procedure TForm2.FormCreate(Sender: TObject);
begin
  MesMots.Lines.LoadFromFile('Dico.txt');
end;

//---------- Fonction de calcul de longueur de chaine ----------//
function LgChaine(MaChaine:string):integer;
begin
    LgChaine:=Length(MaChaine);
end;

//---------- Initalisation du mot à trouver et du nombres d'essaies possibles ----------//
Procedure TForm2.MotATrouver(Sender: TObject; var Taille:integer);
var
  Nb:integer;
begin
  randomize;
  Nb:=(random(NbMot));
  MotADeviner:=MesMots.Lines[Nb];
  Taille:=LgChaine(MotADeviner);
  NbTaille.Text:=inttostr(Taille);
  case Taille of
    3:Vie:=4;
    4:Vie:=7;
    5:Vie:=10;
    6:Vie:=16;
    7:Vie:=20;
  end;

end;

//---------- Action après click sur "Quitter" ----------//
procedure TForm2.QuitterClick(Sender: TObject);
begin
  Showmessage('Au revoir !');
  Close;
end;
//---------- Action après click sur "Commencer" ----------//
procedure TForm2.cmdLancementClick(Sender: TObject);
begin
  MotATrouver(Sender,Taille);
  cmdLancement.Enabled:=False;
  cmdValider.Enabled:=True;
  Chaine.Enabled:=True;
  MaVie.Text:=inttostr(Vie);
  Chaine.Text:='';
  NbBulls.Text:='';
  NbCow.Text:='';
end;

//---------- Action après click sur "Valider" ----------//
procedure TForm2.cmdValiderClick(Sender: TObject);
begin
  MaChaine:=Chaine.Text;
  ValidationInputAlphabet();
  if ValidationInputAlphabet=False then
     showmessage('Pas de caractères spéciaux !')
  else if ValidationInputTaille=False then
     showmessage('Entrez '+inttostr(Taille)+' caractères')
  else if ValidationInputLettre=False then
     showmessage('Pas de doublons, entrez uniquement des caractères différents')
  else
     begin
       Bulls(Sender,BullsNb);
       Cows(Sender,CowsNb);
       Vie:=Vie-1;
     end;
  MaVie.Text:=inttostr(Vie);
  Victoire();                                     //A Partir d'ici j'ai voulu créer une nouvelle
  Defaite();                                      //Procedure, je n'ai pas réussi il ne reconnaissait pas
  if Victoire=True then                           //Mes fonctions
     begin                                        //Verif de la victoire
       showmessage('Victoire ! Bien joué !');
       cmdValider.Enabled:=False;
       Chaine.Enabled:=False;
       cmdLAncement.Enabled:=True;
     end
  else if Defaite=True then                       //Verif de la défaite
    begin
        showmessage('Défaite ! Plus de vie, dommage !');
        cmdValider.Enabled:=False;
        Chaine.Enabled:=False;
        cmdLAncement.Enabled:=True;
    end;
End;

//---------- Calcul du nombre de taureau ----------//
Procedure TForm2.Bulls(Sender:TObject;var BullsNb:integer);
var
  i:integer;
begin
  BullsNb:=0;
  for i := MIN to Taille do
    begin
      if MaChaine[i]=MotADeviner[i] then
        begin
          BullsNb:=BullsNB+1;
        end;
    end;
    NbBulls.Text:=inttostr(BullsNb);
end;

//---------- Calcul du nombres de vaches ----------//
Procedure TForm2.Cows(Sender:TObject;var CowsNb:integer);
var
  i,j:integer;
begin
  CowsNb:=0;
  for i := MIN to Taille do
    begin
      for j := MIN to Taille do
        begin
          if MaChaine[i]=MotADeviner[j] then
             CowsNb:=CowsNb+1;
        end;
    end;
      NbCow.Text:=inttostr(CowsNb);
end;

//---------- Fonction validation de l'input -----------//
Function TForm2.ValidationInputAlphabet():Boolean;
var
  i,j:integer;
  Valid:integer;
begin
  Valid:=0;
  for i := MIN to LgChaine(MaChaine) do                   //Verif qu'il n'y ai pas de
    begin                                                 //Caractère spéciaux avec une boucle
      for j := MIN to LgChaine(Alphabet) do               //Qui compare les caractères avec
        begin                                             //L'alphabet
          if MaChaine[i]=Alphabet[j] then
              Valid:=Valid+1;
        end;
    end;
    if Valid=LgChaine(MaChaine) then
       ValidationInputAlphabet:=True
    else ValidationInputAlphabet:=False;
End;

//---------- Verif que la taille de l'input soit égale a celle du mot à deviner ----------//
Function TForm2.ValidationInputTaille():Boolean;
begin
    if LgChaine(MotADeviner)<>LgChaine(MaChaine) then
      ValidationInputTaille:=False
    else ValidationInputTaille:=True;
end;

//----------Verif qu'il n'y ai pas deux meme lettre ----------//
Function TForm2.ValidationInputLettre():Boolean;
var
  i,j,compteur:integer;
begin
    for i := 1 to Taille do
      begin
        compteur:=0;
        for j := 1 to Taille do
          begin
           if MaChaine[i]=MaChaine[j] then
             Compteur:=Compteur+1;
             if compteur>1 then
                ValidationInputLettre:=False
          end;
      end;
end;
//---------- Condition de victoire ----------//
Function TForm2.Victoire():Boolean;
Begin
  if MaChaine=MotADeviner then
    Victoire:=True
  else Victoire:=False;
End;
//---------- Condition de défaite ----------//
Function TForm2.Defaite():Boolean;
Begin
    if Vie=0 then
      Defaite:=True
    else Defaite:=False;
End;
end.
