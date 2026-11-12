package §_-AKx§
{
   import §_-Bac§.§_-L9§;
   import §_-Bi2§.§_-5bz§;
   import §_-Bi2§.§_-Fs§;
   
   public class §_-3yT§ extends §_-L9§
   {
      public function §_-3yT§(param1:int, param2:int, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-5bz§();
      }
      
      protected function §_-4Ou§(param1:int) : void
      {
         §_-CIo§.x += param1;
         §_-8RM§.x += param1;
         §_-8v§.x += param1;
         §_-0WQ§.x += param1;
         §_-8y0§.x += param1;
      }
      
      protected function §_-2EU§(param1:int) : void
      {
         §_-CIo§.y += param1;
         §_-8RM§.y += param1;
         §_-8v§.y += param1;
         §_-0WQ§.y += param1;
         §_-8y0§.y += param1;
      }
      
      public function get §_-3vU§() : §_-5bz§
      {
         return _skin as §_-5bz§;
      }
   }
}

