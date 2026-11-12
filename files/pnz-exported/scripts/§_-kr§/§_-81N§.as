package §_-kr§
{
   import §_-0lt§.*;
   import §_-786§.§_-CRy§;
   import flash.events.EventDispatcher;
   
   public class §_-81N§ extends EventDispatcher
   {
      private static const §_-4je§:Object = {
         "movieclip":SWFSharedLoadingItem,
         "zip":ZipSharedLoadingItem
      };
      
      private var §_-3gI§:Array = [];
      
      private var §_-AMG§:Array = [];
      
      public function §_-81N§()
      {
         super();
      }
      
      public function get §_-Bic§() : Array
      {
         return this.§_-AMG§;
      }
      
      public function load() : void
      {
         this.loadItem();
      }
      
      public function destroy() : void
      {
         var _loc1_:SharedLoadingItem = null;
         for each(_loc1_ in this.§_-AMG§)
         {
            _loc1_.removeEventListener(§_-CRy§.§_-Sf§,this.onComplete);
            _loc1_.removeEventListener(§_-CRy§.§_-2qp§,this.onError);
         }
      }
      
      public function add(param1:Object) : void
      {
         if(!param1.hasOwnProperty("id") || !param1.hasOwnProperty("type"))
         {
            return;
         }
         if(§_-4je§[param1["type"]] == null)
         {
            throw new Error("SharedLoadingItem for type: " + param1["type"] + " is not defined");
         }
         var _loc2_:SharedLoadingItem = new §_-4je§[param1["type"]](param1["id"]);
         this.§_-3gI§.push(_loc2_);
      }
      
      private function loadItem() : void
      {
         if(this.§_-3gI§.length <= 0)
         {
            dispatchEvent(new §_-CRy§(§_-CRy§.§_-Sf§));
            return;
         }
         var _loc1_:SharedLoadingItem = this.§_-3gI§.shift();
         _loc1_.addEventListener(§_-CRy§.§_-Sf§,this.onComplete);
         _loc1_.addEventListener(§_-CRy§.§_-2qp§,this.onError);
         _loc1_.load();
      }
      
      private function onError(param1:§_-CRy§) : void
      {
         param1.loadingItem.removeEventListener(§_-CRy§.§_-Sf§,this.onComplete);
         param1.loadingItem.removeEventListener(§_-CRy§.§_-2qp§,this.onError);
         dispatchEvent(new §_-CRy§(§_-CRy§.§_-2qp§,0,param1.loadingItem));
         this.loadItem();
      }
      
      private function onComplete(param1:§_-CRy§) : void
      {
         this.§_-AMG§.push(param1.loadingItem);
         this.loadItem();
      }
   }
}

