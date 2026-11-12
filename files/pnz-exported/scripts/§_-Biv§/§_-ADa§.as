package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-7E1§;
   
   public class §_-ADa§ extends §_-3iK§
   {
      public function §_-ADa§()
      {
         super("challenge_stop");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§(§_-C6H§,"Stop clan challenge and award rewards",§_-C6H§,"admin",[]);
         _loc1_.§_-AqZ§(§_-C6H§,"Немедленная остановка челленжа и выдача наград");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         return new §_-4Ww§();
      }
   }
}

