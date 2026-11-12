package §_-AKx§
{
   import §_-18o§.§_-A1F§;
   
   public class §_-5hc§
   {
      private static const §_-2wG§:int = 2;
      
      private static var §_-2Oy§:Array = [];
      
      private static var §_-7aW§:Array = [];
      
      private static var §_-7du§:§_-GN§ = null;
      
      private static var §_-Cdr§:int = 0;
      
      public function §_-5hc§()
      {
         super();
      }
      
      public static function §_-57w§(param1:§_-GN§, param2:Boolean = true) : void
      {
         if(param2)
         {
            §_-7Bn§(param1);
         }
         else
         {
            §_-Js§(param1);
         }
         if(§_-7du§ == null)
         {
            §_-94o§();
         }
      }
      
      private static function §_-7Bn§(param1:§_-GN§) : void
      {
         var _loc3_:§_-GN§ = null;
         var _loc4_:Class = null;
         if(§_-7du§ != null && param1 is §_-A1F§.getClass(§_-7du§))
         {
            return;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in §_-2Oy§)
         {
            _loc4_ = §_-A1F§.getClass(param1);
            if(_loc3_ is _loc4_)
            {
               _loc2_ = true;
            }
         }
         if(!_loc2_)
         {
            §_-2Oy§.push(param1);
         }
      }
      
      private static function §_-Js§(param1:§_-GN§) : void
      {
         var _loc3_:§_-GN§ = null;
         var _loc4_:Class = null;
         if(§_-7du§ != null && param1 is §_-A1F§.getClass(§_-7du§))
         {
            return;
         }
         var _loc2_:Boolean = false;
         for each(_loc3_ in §_-7aW§)
         {
            _loc4_ = §_-A1F§.getClass(param1);
            if(_loc3_ is _loc4_)
            {
               _loc2_ = true;
            }
         }
         if(!_loc2_)
         {
            §_-7aW§.push(param1);
         }
      }
      
      public static function §_-A5e§() : void
      {
         §_-Cdr§ = 0;
         §_-94o§();
      }
      
      private static function §_-94o§() : void
      {
         if(§_-2Oy§.length == 0 && §_-7aW§.length == 0)
         {
            return;
         }
         if(§_-2Oy§.length != 0)
         {
            §_-7du§ = §_-2Oy§.shift();
         }
         else if(§_-7aW§.length != 0 && §_-Cdr§ < §_-2wG§)
         {
            §_-7du§ = §_-7aW§.shift();
         }
         if(§_-7du§ != null)
         {
            §_-7du§.addEventListener(§_-2-c§.§_-41T§,§_-9QK§);
            §_-7du§.showModal();
            ++§_-Cdr§;
         }
      }
      
      private static function §_-9QK§(param1:§_-2-c§) : void
      {
         (param1.currentTarget as §_-GN§).removeEventListener(§_-2-c§.§_-41T§,§_-9QK§);
         §_-7du§ = null;
         §_-94o§();
      }
   }
}

