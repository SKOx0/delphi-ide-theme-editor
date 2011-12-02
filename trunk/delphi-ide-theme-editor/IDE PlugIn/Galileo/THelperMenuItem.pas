type
  THelperMenuItem=class(TMenuItem)
  private
   FCaption            :string;
   FChecked            :Boolean;
   FEnabled            :Boolean;
   FDefault            :Boolean;
   FAutoHotkeys        :TMenuItemAutoFlag;
   FAutoLineReduction  :TMenuItemAutoFlag;
   FRadioItem          :Boolean;
   FVisible            :Boolean;
   FGroupIndex         :Byte;
   FImageIndex         :TImageIndex;
   FActionLink         :TMenuActionLink;
   FBreak              :TMenuBreak;
   FBitmap             :TBitmap;
   FCommand            :Word;
   FHelpContext        :THelpContext;
   FHint               :string;
   FItems              :TList;
   FShortCut           :TShortCut;
   FParent             :TMenuItem;
   FMerged             :TMenuItem;
   FMergedWith         :TMenuItem;
   FMenu               :TMenu;
   FStreamedRebuild    :Boolean;
   FImageChangeLink    :TChangeLink;
   FSubMenuImages      :TCustomImageList;
   FOnChange           :TMenuChangeEvent;
   FOnClick            :TNotifyEvent;
   FOnDrawItem         :TMenuDrawItemEvent;
   FOnAdvancedDrawItem :TAdvancedMenuDrawItemEvent;
   FOnMeasureItem      :TMenuMeasureItemEvent;
   FAutoCheck          :Boolean;
   FHandle             :HMENU;
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
   FRelease            :IInternalRelease;
   FComponentStyle     :TComponentStyle;
   function GetItem(Index: Integer): TMenuItem;
  public
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure InitiateAction;
   procedure Insert(Index: Integer; Item: TMenuItem);
   procedure Delete(Index: Integer);
   procedure Clear;
   procedure Click;
   function Find(ACaption: string): TMenuItem;
   function IndexOf(Item: TMenuItem): Integer;
   function IsLine: Boolean;
   procedure GetChildren(Proc: TGetChildProc = procedure(Child: TComponent) of object; Root: TComponent);
   function GetEnumerator: TMenuItemEnumerator;
   function GetImageList: TCustomImageList;
   function GetParentComponent: TComponent;
   function GetParentMenu: TMenu;
   function HasParent: Boolean;
   function NewTopLine: Integer;
   function NewBottomLine: Integer;
   function InsertNewLineBefore(AItem: TMenuItem): Integer;
   function InsertNewLineAfter(AItem: TMenuItem): Integer;
   procedure Add(Item: TMenuItem);
   (basic) procedure Add;
   procedure Remove(Item: TMenuItem);
   function RethinkHotkeys: Boolean;
   function RethinkLines: Boolean;
   procedure SetParentComponent(Value: TComponent);
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
   property Release: IInternalRelease;
   property Command: Word;
   property Handle: HMENU;
   property Count: Integer;
   property MenuIndex: Integer;
   property Parent: TMenuItem;
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
   property Action: TBasicAction;
   property AutoCheck: Boolean;
   property AutoHotkeys: TMenuItemAutoFlag;
   property AutoLineReduction: TMenuItemAutoFlag;
   property Bitmap: TBitmap;
   property Break: TMenuBreak;
   property Caption: string;
   property Checked: Boolean;
   property SubMenuImages: TCustomImageList;
   property Default: Boolean;
   property Enabled: Boolean;
   property GroupIndex: Byte;
   property HelpContext: THelpContext;
   property Hint: string;
   property ImageIndex: TImageIndex;
   property RadioItem: Boolean;
   property ShortCut: TShortCut;
   property Visible: Boolean;
   property OnClick: TNotifyEvent;
   property OnDrawItem: TMenuDrawItemEvent;
   property OnAdvancedDrawItem: TAdvancedMenuDrawItemEvent;
   property OnMeasureItem: TMenuMeasureItemEvent;
   property Name: TComponentName;
   property Tag: NativeInt;
  end;
