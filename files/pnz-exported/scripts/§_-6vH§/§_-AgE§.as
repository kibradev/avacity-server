package §_-6vH§
{
   import §_-6-L§.§_-49j§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-AgE§ implements §_-8d2§
   {
      public static const §_-Aum§:String = "uids";
      
      private var §_-0oR§:Array = [];
      
      public function §_-AgE§()
      {
         super();
      }
      
      public function get userIds() : Array
      {
         return this.§_-0oR§;
      }
      
      public function set userIds(param1:Array) : void
      {
         this.§_-0oR§ = param1;
      }
      
      public function §_-7if§(param1:String) : void
      {
         if(this.§_-0oR§.indexOf(param1) < 0)
         {
            this.§_-0oR§.push(param1);
         }
      }
      
      public function §_-8e0§(param1:String) : void
      {
         if(!this.contains(param1))
         {
            return;
         }
         §_-49j§.remove(this.§_-0oR§,param1);
      }
      
      public function contains(param1:String) : Boolean
      {
         return this.§_-0oR§.indexOf(param1) >= 0;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-0oR§ = [];
         var _loc2_:§_-1e5§ = param1.§_-CUA§(§_-Aum§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.§_-0oR§.push(_loc2_.getString(_loc3_));
            _loc3_++;
         }
      }
      
      public function get size() : int
      {
         return this.§_-0oR§ != null ? int(this.§_-0oR§.length) : 0;
      }
   }
}

