type
  TGxMenuAction=class(TGxCustomAction)
  private
   FAssociatedMenuItem :TMenuItem;
   FIdeShortCut        :IGxKeyboardShortCut;
   FDisableIfNoHandler :Boolean;
   FCaption            :string;
   FChecking           :Boolean;
   FChecked            :Boolean;
   FEnabled            :Boolean;
   FGroupIndex         :Integer;
   FHelpType           :THelpType;
   FHelpContext        :THelpContext;
   FHelpKeyword        :string;
   FHint               :string;
   FImageIndex         :TImageIndex;
   FShortCut           :TShortCut;
   FVisible            :Boolean;
   FOnHint             :THintEvent;
   FSecondaryShortCuts :TShortCutList;
   FSavedEnabledState  :Boolean;
   FAutoCheck          :Boolean;
   FCategory           :string;
   FActionList         :TCustomActionList;
   FActionComponent    :TComponent;
   FOnChange           :TNotifyEvent;
   FOnExecute          :TNotifyEvent;
   FOnUpdate           :TNotifyEvent;
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
   FRefCount           :Integer;
   FImage              :TObject;
   FMask               :TObject;
   FClients            :TList;
   FComponentStyle     :TComponentStyle;
  public
   function GetAction: TCustomAction;
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   function DoHint(var HintStr: string): Boolean;
   function Execute: Boolean;
   class destructor Destroy;
   function Execute: Boolean;
   function GetParentComponent: TComponent;
   function HasParent: Boolean;
   procedure SetParentComponent(AParent: TComponent);
   function Update: Boolean;
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   function HandlesTarget(Target: TObject): Boolean;
   procedure UpdateTarget(Target: TObject);
   procedure ExecuteTarget(Target: TObject);
   function Execute: Boolean;
   procedure RegisterChanges(Value: TBasicActionLink);
   procedure UnRegisterChanges(Value: TBasicActionLink);
   function Update: Boolean;
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
   property ShortCut: TShortCut;
   property AutoCheck: Boolean;
   property Caption: string;
   property Checked: Boolean;
   property DisableIfNoHandler: Boolean;
   property Enabled: Boolean;
   property GroupIndex: Integer;
   property HelpContext: THelpContext;
   property HelpKeyword: string;
   property HelpType: THelpType;
   property Hint: string;
   property ImageIndex: TImageIndex;
   property ShortCut: TShortCut;
   property SecondaryShortCuts: TShortCutList;
   property Visible: Boolean;
   property OnHint: THintEvent;
   property ActionList: TCustomActionList;
   property Index: Integer;
   property ActionComponent: TComponent;
   property OnExecute: TNotifyEvent;
   property OnUpdate: TNotifyEvent;
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
   property Category: string;
   property Name: TComponentName;
   property Tag: NativeInt;
  end;
