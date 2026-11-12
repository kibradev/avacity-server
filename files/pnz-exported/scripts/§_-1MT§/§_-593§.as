package §_-1MT§
{
   import §_-A2M§.§_-4Ba§;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   
   public class §_-593§
   {
      private var §_-17Y§:Object = null;
      
      public function §_-593§()
      {
         super();
         this.§_-17Y§ = this.§_-18n§();
      }
      
      private function §_-18n§() : Object
      {
         var _loc1_:Object = null;
         if(ApplicationDomain.currentDomain.hasDefinition("container.WrapperParams"))
         {
            _loc1_ = ApplicationDomain.currentDomain.getDefinition("container.WrapperParams");
            if(Boolean(_loc1_.hasOwnProperty("fileCache")) && _loc1_["fileCache"] != null)
            {
               return _loc1_.fileCache;
            }
         }
         return null;
      }
      
      public function isActive() : Boolean
      {
         return this.§_-17Y§ != null;
      }
      
      public function hasSwf(param1:String, param2:String, param3:Function) : void
      {
         if(!this.isActive())
         {
            return;
         }
         if(!this.§_-17Y§.hasOwnProperty("hasSwf"))
         {
            return;
         }
         this.§_-17Y§.hasSwf(param1,param2,param3);
      }
      
      public function §_-42o§(param1:String, param2:String) : §_-4Ba§
      {
         if(!this.isActive())
         {
            return §_-4Ba§.reject();
         }
         if(!this.§_-17Y§.hasOwnProperty("hasSwf"))
         {
            return §_-4Ba§.reject();
         }
         var _loc3_:§_-4Ba§ = new §_-4Ba§();
         this.hasSwf(param1,param2,_loc3_.resolve);
         return _loc3_;
      }
      
      public function saveSwf(param1:String, param2:String, param3:ByteArray) : void
      {
         if(!this.isActive())
         {
            return;
         }
         if(!this.§_-17Y§.hasOwnProperty("saveSwf"))
         {
            return;
         }
         this.§_-17Y§.saveSwf(param1,param2,param3);
      }
      
      public function getSwf(param1:String, param2:Function, param3:Function) : void
      {
         if(!this.isActive())
         {
            return;
         }
         if(!this.§_-17Y§.hasOwnProperty("getSwf"))
         {
            return;
         }
         this.§_-17Y§.getSwf(param1,param2,param3);
      }
   }
}

