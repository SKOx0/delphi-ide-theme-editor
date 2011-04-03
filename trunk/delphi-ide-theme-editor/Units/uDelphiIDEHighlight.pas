{**************************************************************************************************}
{                                                                                                  }
{ Unit uDelphiIDEHighlight                                                                         }
{ unit uDelphiIDEHighlight  for the Delphi IDE Theme Editor                                        }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is uDelphiIDEHighlight.pas.                                                    }
{                                                                                                  }
{ The Initial Developer of the Original Code is Rodrigo Ruz V.                                     }
{ Portions created by Rodrigo Ruz V. are Copyright (C) 2011 Rodrigo Ruz V.                         }
{ All Rights Reserved.                                                                             }
{                                                                                                  }
{**************************************************************************************************}


unit uDelphiIDEHighlight;

interface

uses
 SysUtils,
 Classes,
 ComCtrls,
 uDelphiVersions;

type
  TIDEHighlightElements =
  (
   AdditionalSearchMatchHighlight,
   Assembler,
   AttributeNames,
   AttributeValues,
   BraceHighlight,
   Character,
   CodeFoldingTree,
   Comment,
   DiffAddition,
   DiffDeletion,
   DiffMove,
   DisabledBreak,
   EnabledBreak,
   ErrorLine,
   ExecutionPoint,
   Float,
   FoldedCode,
   Hex,
   HotLink,
   Identifier,
   IllegalChar,
   InvalidBreak,
   LineHighlight,
   LineNumber,
   MarkedBlock,
   ModifiedLine,
   Number,
   Octal,
   PlainText,
   Preprocessor,
   ReservedWord,
   RightMargin,
   Scripts,
   SearchMatch,
   &String,
   Symbol,
   SyncEditBackground,
   SyncEditHighlight,
   Tags,
   Whitespace
  );


  TIDEHighlightElementsAttributes=
  (
    Bold,
    Italic,
    Underline,
    DefaultForeground,
    DefaultBackground,
    ForegroundColorNew,
    BackgroundColorNew
  );

  TIDEImportThemes=
  (
   VisualStudioThemes,
   EclipseTheme
  );

  TItemIDEHighlightElementsAttributes= record
    Bold              : Boolean;
    Italic            : Boolean;
    Underline         : Boolean;
    DefaultForeground : Boolean;
    DefaultBackground : Boolean;
    ForegroundColorNew: String;
    BackgroundColorNew: String;
  end;

  TIDETheme = Array[TIDEHighlightElements] of  TItemIDEHighlightElementsAttributes;

const
  IDEHighlightElementsMinVersion: array[TIDEHighlightElements] of Double =
  (
   20,//AdditionalSearchMatchHighlight,
   13,//Assembler,
   13,//AttributeNames,
   13,//AttributeValues,
   17,//BraceHighlight,
   13,//Character,
   17,//CodeFoldingTree,
   13,//Comment,
   17,//DiffAddition,
   17,//DiffDeletion,
   17,//DiffMove,
   13,//DisabledBreak,
   13,//EnabledBreak,
   13,//ErrorLine,
   13,//ExecutionPoint,
   13,//Float,
   17,//FoldedCode,
   13,//Hex,
   13,//HotLink,
   13,//Identifier,
   13,//IllegalChar,
   13,//InvalidBreak,
   17,//LineHighlight,
   17,//LineNumber,
   13,//MarkedBlock,
   18,//ModifiedLine,
   13,//Number,
   13,//Octal,
   13,//PlainText,
   13,//Preprocessor,
   13,//ReservedWord,
   13,//RightMargin,
   13,//Scripts,
   13,//SearchMatch,
   13,//&String,
   13,//Symbol,
   17,//SyncEditBackground,
   17,//SyncEditHighlight,
   13,//Tags,
   13//Whitespace
  );

  IDEHighlightElementsNames: array[TIDEHighlightElements] of string = (
   'Additional search match highlight',
   'Assembler',
   'Attribute Names',
   'Attribute Values',
   'Brace Highlight',
   'Character',
   'Code folding tree',
   'Comment',
   'Diff addition',
   'Diff deletion',
   'Diff move',
   'Disabled break',
   'Enabled break',
   'Error line',
   'Execution point',
   'Float',
   'Folded code',
   'Hex',
   'Hot Link',
   'Identifier',
   'Illegal Char',
   'Invalid break',
   'Line Highlight',
   'Line Number',
   'Marked block',
   'Modified line',
   'Number',
   'Octal',
   'Plain text',
   'Preprocessor',
   'Reserved word',
   'Right margin',
   'Scripts',
   'Search match',
   'String',
   'Symbol',
   'Sync edit background',
   'Sync edit highlight',
   'Tags',
   'Whitespace'
  );


  IDEHighlightElementsAttributesNames: array[TIDEHighlightElementsAttributes] of string = (
  'Bold',
  'Italic',
  'Underline',
  'Default Foreground',
  'Default Background',
  'Foreground Color New',
  'Background Color New'
  );

  IDEImportThemesNames:  array[TIDEImportThemes] of string =
  (
   'Import Visual Studio Themes (vssettings)',
   'Import Eclipse Themes (Eclipse Color Theme Plugin)'
  );

  IDEImportThemesExt:  array[TIDEImportThemes] of string =
  (
   '*.vssettings',
   '*.xml'
  );

  IDEImportThemesDialogFilter:  array[TIDEImportThemes] of string =
  (
   'Visual Studio Configuration File|*.vssettings',
   'Eclipse Theme (Eclipse Color Theme Plugin)|*.xml'
  );





function  GetForegroundColor(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
function  GetBackgroundColor(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
function  GetBoldValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
function  GetItalicValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
function  GetUnderLineValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
function  GetDefaultForegroundValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
function  GetDefaultBackgroundValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;


procedure FillListAvailableElements(DelphiVersion:TDelphiVersions;List: TStrings);
procedure FillListIDEThemesImport(List: TStrings);


procedure ImportDelphiIDEThemeFromReg(var ATheme : TIDETheme;DelphiVersion:TDelphiVersions);
procedure ImportDelphiIDEThemeFromRegExt(var ATheme : TIDETheme;DelphiVersion:TDelphiVersions);//internal use only
function  GetIDEFontName(DelphiVersion:TDelphiVersions):string;
function  GetIDEFontSize(DelphiVersion:TDelphiVersions):Integer;
function  SetIDEFont(DelphiVersion:TDelphiVersions;const FontName:String;FontSize:Integer):Boolean;
function  SaveIDEThemeToRegFile(DelphiVersion:TDelphiVersions;const ATheme : TIDETheme;Path,Name:string):TFileName;
function  SaveIDEThemeToXmlFile(DelphiVersion:TDelphiVersions;const ATheme : TIDETheme;const Path,Name:string):TFileName;

function  ImportVisualStudioTheme(DelphiVersion:TDelphiVersions;const FileName,Path:TFileName;var ThemeName:string):boolean;
function  ImportEclipseTheme(DelphiVersion:TDelphiVersions;const FileName,Path:TFileName;var ThemeName:string):boolean;

function  LoadThemeFromXMLFile(var ATheme : TIDETheme;const FileName:TFileName):Boolean;
function  SetIDEDefaultTheme(DelphiVersion:TDelphiVersions): Boolean;
function  ApplyIDETheme(DelphiVersion:TDelphiVersions;const  ATheme : TIDETheme) : Boolean;
function  GetIDEDefaultTheme(DelphiVersion:TDelphiVersions): TIDETheme;


function  ExistIDEThemeToImport(DelphiVersion:TDelphiVersions): Boolean;


implementation

uses
  Forms,
  Graphics,
  ShellAPI,
  IOUtils,
  ComObj,
  Variants,
  TypInfo,
  XMLDoc,
  XMLIntf,
  Windows,
  uRegistry;

const
  Msxml2_DOMDocument='Msxml2.DOMDocument.6.0';

{$R DefaultThemes.RES}

function  ExistIDEThemeToImport(DelphiVersion:TDelphiVersions): Boolean;
begin
  Result:=RegKeyExists(DelphiRegPaths[DelphiVersion]+'\Editor\Highlight\Assembler',HKEY_CURRENT_USER);
end;


procedure FillListIDEThemesImport(List: TStrings);
var
 IDETheme : TIDEImportThemes;
begin
   List.BeginUpdate;
   try
    List.Clear;
    for IDETheme in [Low(TIDEImportThemes)..High(TIDEImportThemes)] do
        List.AddObject(IDEImportThemesNames[IDETheme],TObject(Ord(IDETheme)));
   finally
    List.EndUpdate;
   end;
end;

function RunAndWait(hWnd: HWND; const aFile, aParameters: string) : Boolean;
var
  sei: TShellExecuteInfo;
  lpExitCode: DWORD;
begin
  Result:=False;
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.Wnd := hWnd;
  sei.fMask := SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  //sei.lpVerb := 'runas';
  sei.lpFile := PChar(aFile);
  sei.lpParameters := PChar(aParameters);
  sei.nShow := SW_SHOWNORMAL;

  if not ShellExecuteEx(@sei) then
    RaiseLastOSError;

  if sei.hProcess <> 0 then
  begin
    while WaitForSingleObject(sei.hProcess, 50) = WAIT_TIMEOUT do
      Application.ProcessMessages;
    GetExitCodeProcess(sei.hProcess, lpExitCode);
    Result:=lpExitCode=0;
    CloseHandle(sei.hProcess);
  end;
end;

function  ApplyIDETheme(DelphiVersion:TDelphiVersions;const  ATheme : TIDETheme) : Boolean;
 var
  FileName: TFileName;
begin
  FileName:=SaveIDEThemeToRegFile(DelphiVersion,ATheme,ExtractFilePath(ParamStr(0)),'Dummy');
  Result:= FileExists(FileName) and RunAndWait(0,'regedit.exe','/S "'+FileName+'"');
  TFile.Delete(FileName);
end;

function  SetIDEDefaultTheme(DelphiVersion:TDelphiVersions): Boolean;
 var
  AStream : TResourceStream;
  FStream : TFileStream;
  FileName: TFileName;
  ResName : String;
 begin
 {
  Delphi5 RCDATA 5.reg
  Delphi6 RCDATA 6.reg
  Delphi7 RCDATA 7.reg
  Delphi2005 RCDATA 2005.reg
  Delphi2006 RCDATA 2006.reg
  Delphi2007 RCDATA 2007.reg
  Delphi2009 RCDATA 2009.reg
  Delphi2010 RCDATA 2010.reg
  DelphiXE RCDATA XE.reg
 }
  Result:=False;
  ResName  := GetEnumName(TypeInfo(TDelphiVersions),integer(DelphiVersion));
  FileName := ExtractFilePath(Paramstr(0))+'Dummy.reg';
  TFile.Delete(FileName);
  AStream  := TResourceStream.Create(hInstance, ResName, RT_RCDATA) ;
  try
   FStream := TFileStream.Create(FileName, fmCreate) ;
   try
    FStream.CopyFrom(AStream, 0) ;
   finally
    FStream.Free;
   end;
   Result:= FileExists(FileName) and RunAndWait(0,'regedit.exe','/S "'+FileName+'"');
  finally
   TFile.Delete(FileName);
   AStream.Free;
  end;
end;

function  GetIDEDefaultTheme(DelphiVersion:TDelphiVersions): TIDETheme;
 var
  AStream : TResourceStream;
  FStream : TFileStream;
  FileName: TFileName;
  ResName : String;
  RegFile : TStrings;
begin
  ResName  := GetEnumName(TypeInfo(TDelphiVersions),integer(DelphiVersion));
  FileName := ExtractFilePath(Paramstr(0))+'Dummy.reg';
  TFile.Delete(FileName);
  AStream  := TResourceStream.Create(hInstance, ResName, RT_RCDATA) ;
  RegFile  := TStringList.Create;
  try
   FStream := TFileStream.Create(FileName, fmCreate) ;
   try
    FStream.CopyFrom(AStream, 0) ;
   finally
    FStream.Free;
   end;

   RegFile.LoadFromFile(FileName,TEncoding.Unicode);
   RegFile.Text:=StringReplace(RegFile.Text,'\Editor\Highlight','\Editor\DelphiTheme\Highlight',[rfReplaceAll]);
   RegFile.SaveToFile(FileName,TEncoding.Unicode);
   RunAndWait(0,'regedit.exe','/S "'+FileName+'"');
   ImportDelphiIDEThemeFromRegExt(Result,DelphiVersion);
  finally
   TFile.Delete(FileName);
   AStream.Free;
   RegFile.Free;
  end;
end;


function  LoadThemeFromXMLFile(var ATheme : TIDETheme;const FileName:TFileName) : Boolean;
var
  XmlDocIDETheme : OleVariant;
  xPathElement   : string;
  Element        : TIDEHighlightElements;
  ElementName    : string;
begin
 Result:=False;
  XmlDocIDETheme       := CreateOleObject(Msxml2_DOMDocument);
  XmlDocIDETheme.Async := False;
  try
    //XmlDocIDETheme.LoadXML(TFile.ReadAllText(FileName));
    XmlDocIDETheme.Load(FileName);
    XmlDocIDETheme.SetProperty('SelectionLanguage','XPath');
    if (XmlDocIDETheme.parseError.errorCode <> 0) then
     raise Exception.CreateFmt('Error in Delphi theme Xml Data %s',[XmlDocIDETheme.parseError]);


      for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
      begin
        ElementName:=GetEnumName(TypeInfo(TIDEHighlightElements),integer(Element));
        // /DelphiIDETheme/AdditionalSearchMatchHighlight/Bold
        xPathElement:=Format('//DelphiIDETheme/%s/',[ElementName]);
        ATheme[Element].Bold     :=CompareText(XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'Bold'])).text,'True')=0;
        ATheme[Element].Italic   :=CompareText(XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'Italic'])).text,'True')=0;
        ATheme[Element].Underline:=CompareText(XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'Underline'])).text,'True')=0;
        ATheme[Element].DefaultForeground   :=CompareText(XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'DefaultForeground'])).text,'True')=0;
        ATheme[Element].DefaultBackground   :=CompareText(XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'DefaultBackground'])).text,'True')=0;

        ATheme[Element].ForegroundColorNew   :=XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'ForegroundColorNew'])).text;
        ATheme[Element].BackgroundColorNew   :=XmlDocIDETheme.selectSingleNode(Format('%s%s',[xPathElement,'BackgroundColorNew'])).text;
      end;

    Result:=True;
  finally
   XmlDocIDETheme    :=Unassigned;
  end;
end;

function  SaveIDEThemeToXmlFile(DelphiVersion:TDelphiVersions;const ATheme : TIDETheme;const Path,Name:string):TFileName;
var
  DelphiComp: TDelphiVersions;
  Element   : TIDEHighlightElements;
  Doc       : TXMLDocument;
  RootNode, ChildNode, oNode : IXMLNode;
begin
  Result:='';
  Doc   :=TXMLDocument.Create(nil);
  try
    Doc.Active := True;
    Doc.Version:='1.0';
    Doc.Encoding:='utf-8';
    Doc.Options := [doNodeAutoIndent];
    RootNode    := Doc.AddChild('DelphiIDETheme');

    //<colorTheme id="1" name="Oblivion" modified="2011-02-11 14:35:49" author="Roger Dudler" website="http://www.rogerdudler.com/?p=362">
    RootNode.Attributes['modified'] := FormatDateTime('YYYY-MM-DD HH:NN:SS',Now);
    RootNode.Attributes['author']   := 'Delphi IDE Theme Editor';
    RootNode.Attributes['versionapp']  := GetFileVersion(ParamStr(0));

    for DelphiComp := Low(TDelphiVersions) to High(TDelphiVersions) do
    begin
      //DelphiNode :=RootNode.AddChild(GetEnumName(TypeInfo(TDelphiVersions),integer(DelphiComp)));

        for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
        begin
            ChildNode := RootNode.AddChild(GetEnumName(TypeInfo(TIDEHighlightElements),integer(Element)));
               oNode  := ChildNode.AddChild('Bold');
               oNode.Text:=BoolToStr(ATheme[Element].Bold,True);
               oNode  := ChildNode.AddChild('Italic');
               oNode.Text:=BoolToStr(ATheme[Element].Italic,True);
               oNode  := ChildNode.AddChild('Underline');
               oNode.Text:=BoolToStr(ATheme[Element].Underline,True);
               oNode  := ChildNode.AddChild('DefaultForeground');
               oNode.Text:=BoolToStr(ATheme[Element].DefaultForeground,True);
               oNode  := ChildNode.AddChild('DefaultBackground');
               oNode.Text:=BoolToStr(ATheme[Element].DefaultBackground,True);
               oNode  := ChildNode.AddChild('ForegroundColorNew');
               oNode.Text:=ATheme[Element].ForegroundColorNew;
               oNode  := ChildNode.AddChild('BackgroundColorNew');
               oNode.Text:=ATheme[Element].BackgroundColorNew;
            {
            ChildNode := RootNode.AddChild(GetEnumName(TypeInfo(TIDEHighlightElements),integer(Element)));
            ChildNode.Attributes['Bold'] := BoolToStr(ATheme[Element].Bold,True);
            ChildNode.Attributes['Italic'] := BoolToStr(ATheme[Element].Italic,True);
            ChildNode.Attributes['Underline'] := BoolToStr(ATheme[Element].Underline,True);
            ChildNode.Attributes['DefaultForeground'] := BoolToStr(ATheme[Element].DefaultForeground,True);
            ChildNode.Attributes['DefaultBackground'] := BoolToStr(ATheme[Element].DefaultBackground,True);
            }
        end;
    end;
    ForceDirectories(Path);
    //Result:=Format('%s%s_%s.theme.xml',[IncludeTrailingPathDelimiter(Path),Name,DelphiVersionsNames[DelphiVersion]]);
    Result:=Format('%s%s.theme.xml',[IncludeTrailingPathDelimiter(Path),Name]);
    Doc.SaveToFile(Result);
  finally
   Doc:=nil;
  end;
end;

function  ImportEclipseTheme(DelphiVersion:TDelphiVersions;const FileName,Path:TFileName;var ThemeName:string):boolean;
var
  XmlDocEclipseTheme         : OleVariant;
  NewTheme                   : TIDETheme;
  EclipseColor               : string;
  EclipseBackGround          : string;
  EclipseForeGround          : string;

  function WebColorToTColor(const S: string): string;
  var I: Integer;
  begin
    I := StrToInt(S);
    Result :=ColorToString((I AND $0000FF00) OR ((I AND $00FF0000) SHR 16) OR ((I AND $000000FF) SHL 16));
  end;

  function GetDataEclipseTheme(const ElementName:String) :Boolean;
  var
    ElementVariant : OleVariant;
  begin
   Result:= False;
   ElementVariant:=XmlDocEclipseTheme.selectSingleNode(Format('%s%s/%s',['//colorTheme/',ElementName,'@color']));
   if (not VarIsClear(ElementVariant)) and (not VarIsNull(ElementVariant)) then
   begin
    EclipseColor:=ElementVariant.text;
    Result:=True;
   end;
  end;

  Procedure SetIDEHighlightElement(Element:TIDEHighlightElements;const EclipseElement:String);
  begin
      if GetDataEclipseTheme(EclipseElement) then
      begin
          NewTheme[Element].Bold:=False;
          NewTheme[Element].Italic:=False;
          NewTheme[Element].Underline:=False;
          NewTheme[Element].DefaultForeground:=False;
          NewTheme[Element].DefaultBackground:=False;
          NewTheme[Element].ForegroundColorNew:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));
          NewTheme[Element].BackgroundColorNew:=EclipseBackGround;
      end
      else
          NewTheme[Element].BackgroundColorNew:=EclipseBackGround;
  end;

begin
  Result:=False;
  NewTheme:=GetIDEDefaultTheme(DelphiVersion);
  XmlDocEclipseTheme       := CreateOleObject(Msxml2_DOMDocument);
  XmlDocEclipseTheme.Async := False;
  try
    //XmlDocEclipseTheme.LoadXML(TFile.ReadAllText(FileName));
    XmlDocEclipseTheme.Load(FileName);
    XmlDocEclipseTheme.SetProperty('SelectionLanguage','XPath');
    if (XmlDocEclipseTheme.parseError.errorCode <> 0) then
     raise Exception.CreateFmt('Error in Eclipse Theme Xml Data %s',[XmlDocEclipseTheme.parseError]);

    GetDataEclipseTheme('background');
    EclipseBackGround:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));

    GetDataEclipseTheme('foreground');
    EclipseForeGround:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));

    SetIDEHighlightElement(TIDEHighlightElements.AdditionalSearchMatchHighlight,'Empty');
    NewTheme[TIDEHighlightElements.AdditionalSearchMatchHighlight].DefaultForeground:=True;
    if GetDataEclipseTheme('selectionBackground') then
    NewTheme[TIDEHighlightElements.AdditionalSearchMatchHighlight].BackgroundColorNew:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));

    SetIDEHighlightElement(TIDEHighlightElements.Assembler,'deprecatedMember');
    SetIDEHighlightElement(TIDEHighlightElements.AttributeNames,'annotatione');
    SetIDEHighlightElement(TIDEHighlightElements.AttributeValues,'annotation');

    SetIDEHighlightElement(TIDEHighlightElements.BraceHighlight,'bracket');
    SetIDEHighlightElement(TIDEHighlightElements.Character,'string');
    SetIDEHighlightElement(TIDEHighlightElements.CodeFoldingTree,'bracket');
    SetIDEHighlightElement(TIDEHighlightElements.Comment,'multiLineComment');
    SetIDEHighlightElement(TIDEHighlightElements.DiffAddition,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.DiffDeletion,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.DiffMove,'Empty');
    //SetIDEHighlightElement(TIDEHighlightElements.DisabledBreak,'Empty');
    //SetIDEHighlightElement(TIDEHighlightElements.EnabledBreak,'Empty');
    //SetIDEHighlightElement(TIDEHighlightElements.ErrorLine,'Empty');
    //SetIDEHighlightElement(TIDEHighlightElements.ExecutionPoint,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Float,'number');
    SetIDEHighlightElement(TIDEHighlightElements.FoldedCode,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Hex,'number');
    SetIDEHighlightElement(TIDEHighlightElements.HotLink,'javadocLink');
    SetIDEHighlightElement(TIDEHighlightElements.Identifier,'localVariableDeclaration');
    SetIDEHighlightElement(TIDEHighlightElements.IllegalChar,'deprecatedMember');
    //SetIDEHighlightElement(TIDEHighlightElements.InvalidBreak,'Empty');


    if GetDataEclipseTheme('selectionBackground') then
    NewTheme[TIDEHighlightElements.LineHighlight].BackgroundColorNew:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));
    NewTheme[TIDEHighlightElements.LineHighlight].DefaultForeground:=True;


    SetIDEHighlightElement(TIDEHighlightElements.LineNumber,'lineNumber');

    if GetDataEclipseTheme('selectionBackground') then
    NewTheme[TIDEHighlightElements.MarkedBlock].BackgroundColorNew:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));
    if GetDataEclipseTheme('selectionForeground') then
    NewTheme[TIDEHighlightElements.MarkedBlock].ForegroundColorNew:=WebColorToTColor(StringReplace(EclipseColor,'#','$',[rfReplaceAll]));


    SetIDEHighlightElement(TIDEHighlightElements.ModifiedLine,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Number,'number');
    SetIDEHighlightElement(TIDEHighlightElements.Octal,'number');
    SetIDEHighlightElement(TIDEHighlightElements.PlainText,'foreground');

    SetIDEHighlightElement(TIDEHighlightElements.Preprocessor,'javadocTag');
    SetIDEHighlightElement(TIDEHighlightElements.ReservedWord,'keyword');
    SetIDEHighlightElement(TIDEHighlightElements.RightMargin,'foreground');
    SetIDEHighlightElement(TIDEHighlightElements.Scripts,'Empty');

    SetIDEHighlightElement(TIDEHighlightElements.SearchMatch,'searchResultIndication');

    SetIDEHighlightElement(TIDEHighlightElements.String,'string');
    SetIDEHighlightElement(TIDEHighlightElements.Symbol,'operator');
    SetIDEHighlightElement(TIDEHighlightElements.SyncEditBackground,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.SyncEditHighlight,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Tags,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Whitespace,'foreground');

    ThemeName:=Copy(ExtractFileName(FileName),1,Pos('.xml',ExtractFileName(FileName))-1);
    SaveIDEThemeToXmlFile(TDelphiVersions.DelphiXE,NewTheme,Path,ThemeName);
    Result:=True;
  finally
   XmlDocEclipseTheme    :=Unassigned;
  end;
end;


function  ImportVisualStudioTheme(DelphiVersion:TDelphiVersions;const FileName,Path:TFileName;var ThemeName:string):boolean;
var
  XmlDocVSTheme              : OleVariant;
  Nodes                      : OleVariant;
  lNodes                     : Integer;

  Categories                 : OleVariant;
  lCategories                : Integer;

  xPathElement               : string;
  Foreground                 : string;
  Background                 : string;
  BoldFont                   : string;

  BackgroundPatch            : string;

  NewTheme                   : TIDETheme;

  function GetDataVSTheme(const ElementName:String) :Boolean;
  var
    i              : Integer;
    ElementVariant : OleVariant;
  begin
   Result:= False;

      for i := 1 to lNodes do
      begin
        xPathElement:='//UserSettings/Category/Category/FontsAndColors/Categories/Category/Items[1]/Item[%d]/';
        xPathElement:=Format(xPathElement,[i]);
        ElementVariant:=XmlDocVSTheme.selectSingleNode(Format('%s%s',[xPathElement,'@Name']));

        if not VarIsNull(ElementVariant) and not VarIsNull(ElementVariant.text) then
        if CompareText(ElementVariant.text,ElementName)=0 then
        begin
            //OutputDebugString(PChar(VarToStr(ElementVariant.text)));
            Foreground:=XmlDocVSTheme.selectSingleNode(Format('%s%s',[xPathElement,'@Foreground'])).text;
            Background:=XmlDocVSTheme.selectSingleNode(Format('%s%s',[xPathElement,'@Background'])).text;
            BoldFont  :=XmlDocVSTheme.selectSingleNode(Format('%s%s',[xPathElement,'@BoldFont'])).text;
            Result:=True;
            Break;
        end;
      end;
  end;

  Procedure SetIDEHighlightElement(Element:TIDEHighlightElements;const VsElement:String);
  var
   UseBackgroundPatch:Boolean;
  begin

      if GetDataVSTheme(VsElement) then
      begin
          UseBackgroundPatch:=(Background='0x02000000');

          NewTheme[Element].Bold:=BoldFont='Yes';
          NewTheme[Element].Italic:=False;
          NewTheme[Element].Underline:=False;
          NewTheme[Element].DefaultForeground:=False;
          NewTheme[Element].DefaultBackground:=False;
          NewTheme[Element].ForegroundColorNew:=StringReplace(Foreground,'0x','$',[rfReplaceAll]);

          if UseBackgroundPatch then
            NewTheme[Element].BackgroundColorNew:=BackgroundPatch
          else
            NewTheme[Element].BackgroundColorNew:=StringReplace(Background,'0x','$',[rfReplaceAll]);
      end
      else
      begin
      {
          NewTheme[Element].Bold:=False;
          NewTheme[Element].Italic:=False;
          NewTheme[Element].Underline:=False;
          NewTheme[Element].DefaultForeground:=False;
          NewTheme[Element].DefaultBackground:=False;
          NewTheme[Element].ForegroundColorNew:='clDefault';
          NewTheme[Element].BackgroundColorNew:=BackgroundPatch;
       }
      end;
  end;

begin
  Result:=False;
  NewTheme:=GetIDEDefaultTheme(DelphiVersion);
  XmlDocVSTheme       := CreateOleObject(Msxml2_DOMDocument);
  XmlDocVSTheme.Async := False;
  try

    //XmlDocVSTheme.LoadXML(TFile.ReadAllText(FileName));
    XmlDocVSTheme.Load(FileName);
    XmlDocVSTheme.SetProperty('SelectionLanguage','XPath');
    if (XmlDocVSTheme.parseError.errorCode <> 0) then
     raise Exception.CreateFmt('Error in Visual Studio Xml Data %s',[XmlDocVSTheme.parseError]);


    Categories := XmlDocVSTheme.selectNodes('//UserSettings/Category/Category/FontsAndColors/Categories/Category');
    lCategories:= Categories.Length;
    if lCategories>1 then
     raise Exception.CreateFmt('Visual Studio theme with multiples Categories %s',['is not supported']);

    //UserSettings/Category/Category/FontsAndColors/Categories/Category/Items
    Nodes := XmlDocVSTheme.selectNodes('//UserSettings/Category/Category/FontsAndColors/Categories/Category/Items[1]/Item');
    lNodes:= Nodes.Length;

    GetDataVSTheme('Plain Text');
    BackgroundPatch:=StringReplace(Background,'0x','$',[rfReplaceAll]);

    SetIDEHighlightElement(TIDEHighlightElements.AdditionalSearchMatchHighlight,'Selected Text');
    NewTheme[TIDEHighlightElements.AdditionalSearchMatchHighlight].DefaultForeground:=True;

    SetIDEHighlightElement(TIDEHighlightElements.Assembler,'Script Keyword');//'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.AttributeNames,'HTML Attribute');
    SetIDEHighlightElement(TIDEHighlightElements.AttributeValues,'HTML Attribute Value');
    SetIDEHighlightElement(TIDEHighlightElements.BraceHighlight,'Brace Matching (Rectangle)');
    SetIDEHighlightElement(TIDEHighlightElements.Character,'String');
    SetIDEHighlightElement(TIDEHighlightElements.CodeFoldingTree,'Collapsible Text');
    SetIDEHighlightElement(TIDEHighlightElements.Comment,'Comment');
    SetIDEHighlightElement(TIDEHighlightElements.DiffAddition,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.DiffDeletion,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.DiffMove,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.DisabledBreak,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.EnabledBreak,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.ErrorLine,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.ExecutionPoint,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Float,'Number');
    SetIDEHighlightElement(TIDEHighlightElements.FoldedCode,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Hex,'Number');
    SetIDEHighlightElement(TIDEHighlightElements.HotLink,'urlformat');
    SetIDEHighlightElement(TIDEHighlightElements.Identifier,'Plain Text');//'Identifier');
    SetIDEHighlightElement(TIDEHighlightElements.IllegalChar,'Syntax Error');
    SetIDEHighlightElement(TIDEHighlightElements.InvalidBreak,'Empty');

    SetIDEHighlightElement(TIDEHighlightElements.LineHighlight,'Selected Text');
    NewTheme[TIDEHighlightElements.LineHighlight].DefaultForeground:=True;

    SetIDEHighlightElement(TIDEHighlightElements.LineNumber,'Line Numbers');
    SetIDEHighlightElement(TIDEHighlightElements.MarkedBlock,'Selected Text');
    SetIDEHighlightElement(TIDEHighlightElements.ModifiedLine,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Number,'Number');
    SetIDEHighlightElement(TIDEHighlightElements.Octal,'Number');
    SetIDEHighlightElement(TIDEHighlightElements.PlainText,'Plain Text');
    SetIDEHighlightElement(TIDEHighlightElements.Preprocessor,'Preprocessor Keyword');
    SetIDEHighlightElement(TIDEHighlightElements.ReservedWord,'Keyword');
    SetIDEHighlightElement(TIDEHighlightElements.RightMargin,'Indicator Margin');
    SetIDEHighlightElement(TIDEHighlightElements.Scripts,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.SearchMatch,'Selected Text');
    SetIDEHighlightElement(TIDEHighlightElements.String,'String');
    SetIDEHighlightElement(TIDEHighlightElements.Symbol,'Plain Text');//'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.SyncEditBackground,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.SyncEditHighlight,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Tags,'Empty');
    SetIDEHighlightElement(TIDEHighlightElements.Whitespace,'Plain Text');
    //Doc.SaveToFile(Result);
    ThemeName:=Copy(ExtractFileName(FileName),1,Pos('.vssettings',ExtractFileName(FileName))-1);
    SaveIDEThemeToXmlFile(TDelphiVersions.DelphiXE,NewTheme,Path,ThemeName);
    Result:=True;
  finally
   XmlDocVSTheme    :=Unassigned;
  end;
end;

procedure FillListAvailableElements(DelphiVersion:TDelphiVersions;List: TStrings);
var
 Element : TIDEHighlightElements;
begin
   List.BeginUpdate;
   try
    List.Clear;
    for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
      if DelphiVersionNumbers[DelphiVersion]>=IDEHighlightElementsMinVersion[Element] then
        List.AddObject(IDEHighlightElementsNames[Element],TObject(Ord(Element)));
   finally
    List.EndUpdate;
   end;
end;

function  GetAtributeValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements;const Atribute:String):string;
begin
 if not RegReadStr(Format('%s\Editor\Highlight\%s',[DelphiRegPaths[DelphiVersion],IDEHighlightElementsNames[Element]]),Atribute,Result,HKEY_CURRENT_USER) then
 Result:='';
end;

function  GetAtributeValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements;const Atribute:String):string;
begin
 if not RegReadStr(Format('%s\Editor\DelphiTheme\Highlight\%s',[DelphiRegPaths[DelphiVersion],IDEHighlightElementsNames[Element]]),Atribute,Result,HKEY_CURRENT_USER) then
 Result:='';
end;

function  GetForegroundColor(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
begin
 Result:=GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.ForegroundColorNew]);
end;

function  GetBackgroundColor(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
begin
 Result:=GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.BackgroundColorNew]);
end;

function  GetBoldValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Bold]),'True')=0;
end;

function  GetItalicValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Italic]),'True')=0;
end;

function  GetUnderLineValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Underline]),'True')=0;
end;

function  GetDefaultForegroundValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.DefaultForeground]),'True')=0;
end;

function  GetDefaultBackgroundValue(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValue(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.DefaultBackground]),'True')=0;
end;

function  GetForegroundColorExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
begin
 Result:=GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.ForegroundColorNew]);
end;

function  GetBackgroundColorExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):string;
begin
 Result:=GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.BackgroundColorNew]);
end;

function  GetBoldValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Bold]),'True')=0;
end;

function  GetItalicValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Italic]),'True')=0;
end;

function  GetUnderLineValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.Underline]),'True')=0;
end;

function  GetDefaultForegroundValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.DefaultForeground]),'True')=0;
end;

function  GetDefaultBackgroundValueExt(DelphiVersion:TDelphiVersions;Element:TIDEHighlightElements):Boolean;
begin
 Result:=CompareText(GetAtributeValueExt(DelphiVersion,Element,IDEHighlightElementsAttributesNames[TIDEHighlightElementsAttributes.DefaultBackground]),'True')=0;
end;


procedure ImportDelphiIDEThemeFromReg(var ATheme : TIDETheme;DelphiVersion:TDelphiVersions);
var
 Element : TIDEHighlightElements;
begin
    for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
    begin
      if DelphiVersionNumbers[DelphiVersion]>=IDEHighlightElementsMinVersion[Element] then
      begin
        ATheme[Element].Bold     :=GetBoldValue(DelphiVersion,Element);
        ATheme[Element].Italic   :=GetItalicValue(DelphiVersion,Element);
        ATheme[Element].Underline:=GetUnderLineValue(DelphiVersion,Element);
        ATheme[Element].DefaultForeground:=GetDefaultForegroundValue(DelphiVersion,Element);
        ATheme[Element].DefaultBackground:=GetDefaultBackgroundValue(DelphiVersion,Element);
        ATheme[Element].ForegroundColorNew:=GetForegroundColor(DelphiVersion,Element);
        ATheme[Element].BackgroundColorNew:=GetBackgroundColor(DelphiVersion,Element);
      end
      else
      begin
        ATheme[Element].Bold     :=false;
        ATheme[Element].Italic   :=false;
        ATheme[Element].Underline:=false;
        ATheme[Element].DefaultForeground:=false;
        ATheme[Element].DefaultBackground:=false;
        ATheme[Element].ForegroundColorNew:='clDefault';
        ATheme[Element].BackgroundColorNew:='clDefault';
      end;
    end;
end;

procedure ImportDelphiIDEThemeFromRegExt(var ATheme : TIDETheme;DelphiVersion:TDelphiVersions);
var
 Element : TIDEHighlightElements;
begin
    for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
    begin
      if DelphiVersionNumbers[DelphiVersion]>=IDEHighlightElementsMinVersion[Element] then
      begin
        ATheme[Element].Bold     :=GetBoldValueExt(DelphiVersion,Element);
        ATheme[Element].Italic   :=GetItalicValueExt(DelphiVersion,Element);
        ATheme[Element].Underline:=GetUnderLineValueExt(DelphiVersion,Element);
        ATheme[Element].DefaultForeground:=GetDefaultForegroundValueExt(DelphiVersion,Element);
        ATheme[Element].DefaultBackground:=GetDefaultBackgroundValueExt(DelphiVersion,Element);
        ATheme[Element].ForegroundColorNew:=GetForegroundColorExt(DelphiVersion,Element);
        ATheme[Element].BackgroundColorNew:=GetBackgroundColorExt(DelphiVersion,Element);
      end
      else
      begin
        ATheme[Element].Bold     :=false;
        ATheme[Element].Italic   :=false;
        ATheme[Element].Underline:=false;
        ATheme[Element].DefaultForeground:=false;
        ATheme[Element].DefaultBackground:=false;
        ATheme[Element].ForegroundColorNew:='clDefault';
        ATheme[Element].BackgroundColorNew:='clDefault';
      end;
    end;
end;

function SaveIDEThemeToRegFile(DelphiVersion:TDelphiVersions;const ATheme : TIDETheme;Path,Name:string):TFileName;
var
 Element : TIDEHighlightElements;
 RegFile : TStringList;
begin
  Result:='';
  RegFile:=TStringList.Create;
  try
{
      Windows Registry Editor Version 5.00
      [HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Editor\Highlight]

      [HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Editor\Highlight\Assembler]
      "Bold"="False"
      "Italic"="False"
      "Underline"="False"
      "Default Foreground"="False"
      "Default Background"="False"
      "Foreground Color New"="$001E1EE8"
      "Background Color New"="$00272727"
}

    RegFile.Add('Windows Registry Editor Version 5.00');
    RegFile.Add('');
    RegFile.Add(Format('[HKEY_CURRENT_USER%s\Editor\Highlight]',[DelphiRegPaths[DelphiVersion]]));
    RegFile.Add('');


    for Element in [Low(TIDEHighlightElements)..High(TIDEHighlightElements)] do
    if DelphiVersionNumbers[DelphiVersion]>=IDEHighlightElementsMinVersion[Element] then
    begin
       RegFile.Add(Format('[HKEY_CURRENT_USER%s\Editor\Highlight\%s]',[DelphiRegPaths[DelphiVersion],IDEHighlightElementsNames[Element]]));
       RegFile.Add(Format('"Bold"="%s"',[BoolToStr(ATheme[Element].Bold,True)]));
       RegFile.Add(Format('"Italic"="%s"',[BoolToStr(ATheme[Element].Italic,True)]));
       RegFile.Add(Format('"Underline"="%s"',[BoolToStr(ATheme[Element].Underline,True)]));
       RegFile.Add(Format('"Default Foreground"="%s"',[BoolToStr(ATheme[Element].DefaultForeground,True)]));
       RegFile.Add(Format('"Default Background"="%s"',[BoolToStr(ATheme[Element].DefaultBackground,True)]));

       RegFile.Add(Format('"Foreground Color New"="%s"',[ATheme[Element].ForegroundColorNew]));
       RegFile.Add(Format('"Background Color New"="%s"',[ATheme[Element].BackgroundColorNew]));

       RegFile.Add('');
    end;

    Result:=Format('%s%s_%s.reg',[IncludeTrailingPathDelimiter(Path),Name,DelphiVersionsNames[DelphiVersion]]);
    RegFile.SaveToFile(Result,TEncoding.Unicode);
  finally
   RegFile.Free;
  end;

end;

function  GetIDEFontName(DelphiVersion:TDelphiVersions):string;
begin
 if not RegReadStr(Format('%s\Editor\Options',[DelphiRegPaths[DelphiVersion]]),'Editor Font',Result,HKEY_CURRENT_USER) then
  Result:='';
end;

function  GetIDEFontSize(DelphiVersion:TDelphiVersions):Integer;
begin
 if not RegReadInt(Format('%s\Editor\Options',[DelphiRegPaths[DelphiVersion]]),'Font Size',Result,HKEY_CURRENT_USER) then
  Result:=0;
end;

function  SetIDEFont(DelphiVersion:TDelphiVersions;const FontName:String;FontSize:Integer):Boolean;
begin
  Result:=
  RegWriteStr(Format('%s\Editor\Options',[DelphiRegPaths[DelphiVersion]]),'Editor Font',FontName,HKEY_CURRENT_USER)
  and
  RegWriteInt(Format('%s\Editor\Options',[DelphiRegPaths[DelphiVersion]]),'Font Size',FontSize,HKEY_CURRENT_USER);
end;

end.
