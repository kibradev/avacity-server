package §_-786§
{
   import §_-0lt§.SharedLoadingItem;
   import flash.events.Event;
   
   public class §_-CRy§ extends Event
   {
      public static const §_-Sf§:String = "contentLoaded";
      
      public static const §_-BhX§:String = "contentProgress";
      
      public static const §_-2qp§:String = "contentError";
      
      public static const §_-AsY§:String = "validateError";
      
      public var §_-Bw4§:Number = 0;
      
      private var _loadingItem:Object = null;
      
      private var §_-C3g§:String = null;
      
      public function §_-CRy§(param1:String, param2:Number = 0, param3:Object = null, param4:String = null)
      {
         super(param1,false,false);
         this.§_-Bw4§ = param2;
         this._loadingItem = param3;
         this.§_-C3g§ = param4;
      }
      
      public function get §_-0lo§() : String
      {
         return this.§_-C3g§;
      }
      
      public function get loadingItem() : SharedLoadingItem
      {
         return this._loadingItem as SharedLoadingItem;
      }
      
      public function get §_-3nI§() : Number
      {
         return this.§_-Bw4§;
      }
      
      override public function clone() : Event
      {
         return new §_-CRy§(type,this.§_-Bw4§);
      }
   }
}

