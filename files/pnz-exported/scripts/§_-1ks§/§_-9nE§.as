package §_-1ks§
{
   import §_-2xw§.§_-7Gh§;
   
   public class §_-9nE§ extends §_-7Gh§
   {
      public function §_-9nE§()
      {
         super();
      }
      
      public function init() : void
      {
      }
      
      override public function activate() : void
      {
         §_-A5u§ = true;
         this.init();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         removeAllChildren(true,true);
         super.destroy();
      }
   }
}

