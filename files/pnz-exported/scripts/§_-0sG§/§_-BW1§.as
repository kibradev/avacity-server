package §_-0sG§
{
   import §_-0uA§.§_-3YE§;
   import §_-5MD§.§_-6vA§;
   
   public class §_-BW1§
   {
      private static var _instance:§_-BW1§;
      
      private var §_-0-3§:Object = {};
      
      public function §_-BW1§()
      {
         super();
      }
      
      public static function get instance() : §_-BW1§
      {
         if(_instance == null)
         {
            _instance = new §_-BW1§();
         }
         return _instance;
      }
      
      public function §_-4u8§(param1:String) : XML
      {
         var _loc2_:* = "map/" + param1 + ".xml";
         if(this.§_-0-3§.hasOwnProperty(_loc2_))
         {
            return this.§_-0-3§[_loc2_];
         }
         _loc2_ = param1 + ".xml";
         return !!this.§_-0-3§.hasOwnProperty(_loc2_) ? this.§_-0-3§[_loc2_] : null;
      }
      
      public function getMap(param1:String) : §_-6vA§
      {
         var map:§_-6vA§;
         var name:String = param1;
         var xml:XML = this.§_-4u8§(name);
         if(xml == null)
         {
            return null;
         }
         map = new §_-6vA§();
         try
         {
            map.unserializeFromXML(xml);
         }
         catch(e:ReferenceError)
         {
            §_-3YE§.error("Error unserialize map " + name + " " + e.message);
            throw e;
         }
         return map;
      }
      
      public function §_-Bk0§(param1:String, param2:XML) : void
      {
         this.§_-0-3§[param1] = param2;
      }
   }
}

