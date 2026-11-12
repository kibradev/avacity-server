package §_-kr§
{
   import §_-2U3§.ResourceManager;
   import §_-GM§.§_-5qn§;
   
   public class §_-0wT§ extends §_-Ud§
   {
      private var §_-BXE§:Object = null;
      
      public function §_-0wT§(param1:Array, param2:Object, param3:Boolean = true)
      {
         this.§_-BXE§ = param2;
         super(param1,param3);
      }
      
      private function §_-CKd§(param1:String) : String
      {
         if(this.§_-BXE§.hasOwnProperty(param1))
         {
            return this.§_-BXE§[param1];
         }
         return null;
      }
      
      override protected function registerWebItem(param1:String) : void
      {
         if(param1.indexOf("config") >= 0)
         {
            §_-5qn§.§_-7vq§(this.§_-CKd§(param1),§_-XD§.getPack(param1));
         }
         else
         {
            ResourceManager.§_-0cZ§(this.§_-CKd§(param1),§_-XD§.getADF(param1));
         }
         _loaded.push(this.§_-CKd§(param1));
         _loaded.push(param1);
      }
   }
}

