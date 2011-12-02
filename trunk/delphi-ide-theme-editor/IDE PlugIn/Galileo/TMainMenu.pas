type
  TMainMenu=class(TMenu)
  private
   FOle2Menu           :HMENU;
   FAutoMerge          :Boolean;
   FBiDiMode           :TBiDiMode;
   FItems              :TMenuItem;
   FWindowHandle       :HWND;
   FOwnerDraw          :Boolean;
   FParentBiDiMode     :Boolean;
   FImageChangeLink    :TChangeLink;
   FImages             :TCustomImageList;
   FOnChange           :TMenuChangeEvent;
   FMenuImage          :string;
   FOwner              :TComponent;
   FName               :TComponentName;
   FTag                :NativeInt;
   FComponents         :TList;
   FFreeNotifies       :TList;
   FDesignInfo         :Integer;
   FComponentState     :TComponentState;
   FVCLComObject       :Pointer;
   FObservers          :TObservers;
   FSortedComponents   :TList;
   function GetComponent(AIndex: Integer): TComponent;
  protected
   FComponentStyle     :TComponentStyle;
  public
   procedure Merge(Menu: TMainMenu);
   procedure Unmerge(Menu: TMainMenu);
   (basic) procedure PopulateOle2Menu;
   (basic) procedure GetOle2AcceleratorTable;
   procedure SetOle2MenuHandle(Handle: HMENU);
   constructor Create(AOwner: TComponent);
   function CreateMenuItem: TMenuItem;
   class destructor Destroy;
   function DispatchCommand(ACommand: Word): Boolean;
   function DispatchPopup(AHandle: HMENU): Boolean;
   function FindItem(Value: NativeUInt; Kind: TFindItemKind): TMenuItem;
   procedure GetChildren(Proc: TGetChildProc = procedure(Child: TComponent) of object; Root: TComponent);
   function GetHelpContext(Value: NativeUInt; ByCommand: Boolean): THelpContext;
   function IsRightToLeft: Boolean;
   function IsShortCut(var Message: TWMKey): Boolean;
   procedure ParentBiDiModeChanged;
   procedure ParentBiDiModeChanged(AControl: TObject);
   procedure ProcessMenuChar(var Message: TWMMenuChar);
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure BeforeDestruction;
   procedure DestroyComponents;
   procedure Destroying;
   function ExecuteAction(Action: TBasicAction): Boolean;
   function FindComponent(const AName: string): TComponent;
   procedure FreeNotification(AComponent: TComponent);
   procedure RemoveFreeNotification(AComponent: TComponent);
   procedure FreeOnRelease;
   function GetEnumerator: TComponentEnumerator;
   function GetParentComponent: TComponent;
   function GetNamePath: string;
   function HasParent: Boolean;
   procedure InsertComponent(AComponent: TComponent);
   procedure RemoveComponent(AComponent: TComponent);
   procedure SetSubComponent(IsSubComponent: Boolean);
   function SafeCallException(ExceptObject: TObject; ExceptAddr: Pointer): HRESULT;
   function UpdateAction(Action: TBasicAction): Boolean;
   function IsImplementorOf(const I: IInterface): Boolean;
   function ReferenceInterface(const I: IInterface; Operation: TOperation): Boolean;
   class destructor Destroy;
   procedure Assign(Source: TPersistent);
   function GetNamePath: string;
   constructor Create;
   procedure Free;
   class function InitInstance(Instance: Pointer): TObject;
   procedure CleanupInstance;
   function ClassType: TClass;
   class function ClassName: string;
   class function ClassNameIs(const Name: string): Boolean;
   class function ClassParent: TClass;
   class function ClassInfo: Pointer;
   class function InstanceSize: Integer;
   class function InheritsFrom(AClass: TClass): Boolean;
   class function MethodAddress(const Name: ShortString): Pointer;
   class function MethodAddress(const Name: string): Pointer;
   class function MethodName(Address: Pointer): string;
   class function QualifiedClassName: string;
   function FieldAddress(const Name: ShortString): Pointer;
   function FieldAddress(const Name: string): Pointer;
   function GetInterface(const IID: TGUID; out Obj): Boolean;
   class function GetInterfaceEntry(const IID: TGUID): PInterfaceEntry;
   class function GetInterfaceTable: PInterfaceTable;
   class function UnitName: string;
   class function UnitScope: string;
   function Equals(Obj: TObject): Boolean;
   function GetHashCode: Integer;
   function ToString: string;
   function SafeCallException(ExceptObject: TObject; ExceptAddr: Pointer): HRESULT;
   procedure AfterConstruction;
   procedure BeforeDestruction;
   procedure Dispatch(var Message);
   procedure DefaultHandler(var Message);
   class function NewInstance: TObject;
   procedure FreeInstance;
   class destructor Destroy;
   property Images: TCustomImageList;
   property AutoHotkeys: TMenuAutoFlag;
   property AutoLineReduction: TMenuAutoFlag;
   property BiDiMode: TBiDiMode;
   property Handle: HMENU;
   property OwnerDraw: Boolean;
   property ParentBiDiMode: Boolean;
   property WindowHandle: HWND;
   property ComObject: IInterface;
   property ComponentCount: Integer;
   property ComponentIndex: Integer;
   property ComponentState: TComponentState;
   property ComponentStyle: TComponentStyle;
   property DesignInfo: Integer;
   property Owner: TComponent;
   property VCLComObject: Pointer;
   property Observers: TObservers;
  published
   property AutoHotkeys: TMenuAutoFlag;
   property AutoLineReduction: TMenuAutoFlag;
   property AutoMerge: Boolean;
   property BiDiMode: TBiDiMode;
   property Images: TCustomImageList;
   property OwnerDraw: Boolean;
   property ParentBiDiMode: Boolean;
   property OnChange: TMenuChangeEvent;
   property Items: TMenuItem;
   property Name: TComponentName;
   property Tag: NativeInt;
  end;
