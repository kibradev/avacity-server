package §_-AKt§
{
   import flash.system.ApplicationDomain;
   
   public class §_-6yd§
   {
      private var §_-C2u§:Function = null;
      
      public function §_-6yd§()
      {
         super();
         try
         {
            this.§_-C2u§ = ApplicationDomain.currentDomain.getDefinition("container.WrapperParams").logoutFunction as Function;
         }
         catch(e:ReferenceError)
         {
         }
      }
      
      public function logout() : void
      {
         if(this.§_-C2u§ != null)
         {
            this.§_-C2u§();
         }
      }
   }
}

