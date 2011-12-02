type
  TImageList=class(TDragImageList)
  private
   FDragCursor         :TCursor;
   FDragging           :Boolean;
   FDragHandle         :HWND;
   FDragHotspot        :TPoint;
   FDragIndex          :Integer;
   FOldCursor          :TCursor;
   FHeight             :Integer;
   FWidth              :Integer;
   FAllocBy            :Integer;
   FHandle             :NativeUInt;
   FDrawingStyle       :TDrawingStyle;
   FMasked             :Boolean;
   FShareImages        :Boolean;
   FImageType          :TImageType;
   FBkColor            :TColor;
   FBlendColor         :TColor;
   FClients            :TList;
   FBitmap             :TBitmap;
   FMonoBitmap         :TBitmap;
   FChanged            :Boolean;
   FUpdateCount        :Integer;
   FOnChange           :TNotifyEvent;
   FColorDepth         :TColorDepth;
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
   function BeginDrag(Window: HWND; X: Integer; Y: Integer): Boolean;
   function DragLock(Window: HWND; XPos: Integer; YPos: Integer): Boolean;
   function DragMove(X: Integer; Y: Integer): Boolean;
   procedure DragUnlock;
   function EndDrag: Boolean;
   function GetHotSpot: TPoint;
   procedure HideDragImage;
   function SetDragImage(Index: Integer; HotSpotX: Integer; HotSpotY: Integer): Boolean;
   procedure ShowDragImage;
   constructor Create(AOwner: TComponent);
   constructor CreateSize(AWidth: Integer; AHeight: Integer);
   class destructor Destroy;
   procedure Assign(Source: TPersistent);
   function Add(Image: TBitmap; Mask: TBitmap): Integer;
   function AddIcon(Image: TIcon): Integer;
   function AddImage(Value: TCustomImageList; Index: Integer): Integer;
   procedure AddImages(Value: TCustomImageList);
   function AddMasked(Image: TBitmap; MaskColor: TColor): Integer;
   procedure BeginUpdate;
   procedure Clear;
   procedure Delete(Index: Integer);
   procedure Draw(Canvas: TCanvas; X: Integer; Y: Integer; Index: Integer; Enabled: Boolean);
   procedure Draw(Canvas: TCanvas; X: Integer; Y: Integer; Index: Integer; ADrawingStyle: TDrawingStyle; AImageType: TImageType; Enabled: Boolean);
   procedure DrawOverlay(Canvas: TCanvas; X: Integer; Y: Integer; ImageIndex: Integer; Overlay: TOverlay; Enabled: Boolean);
   procedure DrawOverlay(Canvas: TCanvas; X: Integer; Y: Integer; ImageIndex: Integer; Overlay: TOverlay; ADrawingStyle: TDrawingStyle; AImageType: TImageType; Enabled: Boolean);
   procedure EndUpdate;
   function FileLoad(ResType: TResType; const Name: string; MaskColor: TColor): Boolean;
   function GetBitmap(Index: Integer; Image: TBitmap): Boolean;
   function GetHotSpot: TPoint;
   procedure GetIcon(Index: Integer; Image: TIcon);
   procedure GetIcon(Index: Integer; Image: TIcon; ADrawingStyle: TDrawingStyle; AImageType: TImageType);
   function GetImageBitmap: HBITMAP;
   function GetMaskBitmap: HBITMAP;
   function GetResource(ResType: TResType; const Name: string; Width: Integer; LoadFlags: TLoadResources; MaskColor: TColor): Boolean;
   function GetInstRes(Instance: NativeUInt; ResType: TResType; const Name: string; Width: Integer; LoadFlags: TLoadResources; MaskColor: TColor): Boolean;
   function GetInstRes(Instance: NativeUInt; ResType: TResType; ResID: Cardinal; Width: Integer; LoadFlags: TLoadResources; MaskColor: TColor): Boolean;
   function HandleAllocated: Boolean;
   procedure Insert(Index: Integer; Image: TBitmap; Mask: TBitmap);
   procedure InsertIcon(Index: Integer; Image: TIcon);
   procedure InsertMasked(Index: Integer; Image: TBitmap; MaskColor: TColor);
   procedure Move(CurIndex: Integer; NewIndex: Integer);
   function Overlay(ImageIndex: Integer; Overlay: TOverlay): Boolean;
   procedure RegisterChanges(Value: TChangeLink);
   function ResourceLoad(ResType: TResType; const Name: string; MaskColor: TColor): Boolean;
   function ResInstLoad(Instance: NativeUInt; ResType: TResType; const Name: string; MaskColor: TColor): Boolean;
   procedure Replace(Index: Integer; Image: TBitmap; Mask: TBitmap);
   procedure ReplaceIcon(Index: Integer; Image: TIcon);
   procedure ReplaceMasked(Index: Integer; NewImage: TBitmap; MaskColor: TColor);
   procedure SetSize(AWidth: Integer; AHeight: Integer);
   procedure UnRegisterChanges(Value: TChangeLink);
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
   property DragCursor: TCursor;
   property DragHotspot: TPoint;
   property Dragging: Boolean;
   property Count: Integer;
   property Handle: NativeUInt;
   property AllocBy: Integer;
   property BlendColor: TColor;
   property BkColor: TColor;
   property DrawingStyle: TDrawingStyle;
   property Height: Integer;
   property ImageType: TImageType;
   property Masked: Boolean;
   property ShareImages: Boolean;
   property Width: Integer;
   property OnChange: TNotifyEvent;
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
   property BlendColor: TColor;
   property BkColor: TColor;
   property AllocBy: Integer;
   property ColorDepth: TColorDepth;
   property DrawingStyle: TDrawingStyle;
   property Height: Integer;
   property ImageType: TImageType;
   property Masked: Boolean;
   property OnChange: TNotifyEvent;
   property ShareImages: Boolean;
   property Width: Integer;
   property ColorDepth: TColorDepth;
   property Name: TComponentName;
   property Tag: NativeInt;
  end;
