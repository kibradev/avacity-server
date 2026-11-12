package §_-AKx§
{
   import §_-A2M§.§_-4Ba§;
   import penzville.Config;
   
   public class §_-4OH§
   {
      public static const §_-3JS§:int = 350;
      
      public static const §continue§:int = 350;
      
      public static const §_-Ki§:int = 420;
      
      public static const §_-B8R§:int = 420;
      
      public function §_-4OH§()
      {
         super();
      }
      
      public static function §_-B5P§(param1:String, param2:String, param3:Function = null, param4:Boolean = true) : §_-GN§
      {
         var _loc5_:§_-GN§ = null;
         if(Config.§_-37U§ == Config.§_-20b§)
         {
            _loc5_ = new §_-2Wb§(§_-B8R§,param1,param2,param4);
         }
         else
         {
            _loc5_ = new §_-BTq§(§_-3JS§,param1,param2);
         }
         _loc5_.showModal(param3);
         return _loc5_;
      }
      
      public static function confirm(param1:String, param2:String, param3:Function = null) : §_-GN§
      {
         var _loc4_:§_-GN§ = null;
         if(Config.§_-37U§ == Config.§_-20b§)
         {
            _loc4_ = new §_-9c6§(§_-Ki§,param1,param2);
         }
         else
         {
            _loc4_ = new §_-2BF§(§continue§,param1,param2);
         }
         _loc4_.showModal(param3);
         return _loc4_;
      }
      
      public static function confirmTask(param1:String, param2:String) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var title:String = param1;
         var description:String = param2;
         task = new §_-4Ba§();
         confirm(title,description,function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               task.resolve();
            }
            else
            {
               task.reject();
            }
         });
         return task;
      }
      
      public static function §_-9Y§(param1:String, param2:String, param3:Function = null, param4:Array = null) : §_-2BF§
      {
         var _loc5_:§_-4e7§ = new §_-4e7§(§continue§,param1,param2,param4);
         _loc5_.showModal(param3);
         return _loc5_;
      }
   }
}

