package §_-SD§
{
   import §_-1Fx§.§_-6gM§;
   import §_-1iV§.§_-BkM§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   
   public class CursorManager extends Sprite
   {
      private static var _instance:CursorManager = null;
      
      private var §_-CGh§:Boolean;
      
      private var §_-33§:Object;
      
      private var §_-5q8§:Boolean = false;
      
      private var §_-4x6§:DisplayObject = null;
      
      private var §_-0jC§:String = null;
      
      private var §_-53x§:Sprite;
      
      private var §_-0ra§:String = null;
      
      private var §_-BOA§:Event;
      
      private var §_-2uB§:§_-BO9§;
      
      private var §_-BRS§:Boolean = false;
      
      private var §_-21F§:DisplayObjectContainer;
      
      public function CursorManager()
      {
         super();
         this.§_-33§ = {};
         this.§_-CGh§ = Mouse.supportsNativeCursor;
         mouseEnabled = false;
         mouseChildren = false;
         this.§_-53x§ = new Sprite();
         this.§_-53x§.mouseChildren = false;
         this.§_-53x§.visible = false;
         addChild(this.§_-53x§);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public static function get instance() : CursorManager
      {
         if(_instance == null)
         {
            _instance = new CursorManager();
         }
         return _instance;
      }
      
      public function §_-8aI§(param1:String, param2:Object, param3:Boolean = true) : void
      {
         /*
          * 