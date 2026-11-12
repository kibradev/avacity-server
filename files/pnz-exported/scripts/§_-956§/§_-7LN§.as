package §_-956§
{
   import §_-0Uz§.§_-m3§;
   import §_-7s3§.§_-BrL§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-7LN§ extends §_-53f§ implements §_-m3§
   {
      public static const §_-0Id§:String = "clan_";
      
      private var _netManager:§_-6GZ§ = null;
      
      private var §_-6X2§:Array = [];
      
      private var _inited:Boolean = false;
      
      public function §_-7LN§()
      {
         super();
      }
      
      public function init() : void
      {
         this._netManager = new §_-6GZ§();
         this._netManager.addEventListener(§_-6p1§.§_-5uU§,this.§_-6U-§);
      }
      
      public function §_-Aw2§() : void
      {
         if(this._netManager != null)
         {
            this._netManager.§_-6M3§();
         }
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function addMessage(param1:§_-BrL§) : void
      {
         if(param1 != null)
         {
            this.§_-6X2§.push(param1);
         }
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      private function §_-6U-§(param1:§_-6p1§) : void
      {
         if(this._inited)
         {
            return;
         }
         this._inited = true;
         var _loc2_:Array = param1.§_-5DH§;
         if(_loc2_ != null)
         {
            this.§_-6X2§ = _loc2_;
            dispatchEvent(new §_-6p1§(§_-6p1§.§_-5uU§,_loc2_));
         }
      }
      
      public function get §_-24a§() : Array
      {
         return this.§_-6X2§;
      }
   }
}

