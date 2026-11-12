package §_-BLR§
{
   import §_-0Ts§.HW20Module;
   import §_-3VF§.§_-0nG§;
   import §_-7Mq§.§_-1ko§;
   import §_-7RO§.HW20MemoriesFinishDialog;
   import §_-COY§.HW18Module;
   
   public class §_-2q4§
   {
      public function §_-2q4§()
      {
         super();
      }
      
      public function §_-3lT§(param1:String, param2:§_-1ko§, param3:String, param4:String) : void
      {
         if(§_-0nG§.instance.getModule(HW20Module.MODULE_ID) != null)
         {
            new HW20MemoriesFinishDialog(param1,param2,param3,param4).showModal();
         }
      }
      
      public function §_-60J§() : int
      {
         var _loc1_:HW18Module = §_-0nG§.instance.getModule(HW18Module.MODULE_ID) as HW18Module;
         if(_loc1_ != null)
         {
            return _loc1_.descriptor.§_-Wx§;
         }
         var _loc2_:HW20Module = §_-0nG§.instance.getModule(HW20Module.MODULE_ID) as HW20Module;
         if(_loc2_ != null)
         {
            return _loc2_.descriptor.§_-Wx§;
         }
         return 0;
      }
   }
}

